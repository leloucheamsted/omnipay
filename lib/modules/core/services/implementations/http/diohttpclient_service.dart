import 'dart:developer';
import 'dart:io';

import 'package:omnipay/modules/core/services/interfaces/icancel_token.dart';

import 'dart:async';
import '../../interfaces/ihttpclient_service.dart';
import 'package:dio/dio.dart';

import 'dio_log_interceptor.dart';
import 'exceptions.dart';

enum RestAction {
  get,
  post,
  put,
  delete,
}

class DioHttpClientService implements IHttpClientService {
  static const baseUrl = "http://192.168.43.62:8080";
  Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {
      "content-type": "application/json",
    },
  ));

  final Function(Map)? customValidateResponse;
  final Function? customErrorParser;
  Map<String, dynamic>? _customHeaders;
  DioHttpClientService({
    this.customValidateResponse,
    this.customErrorParser,
  }) {
    log("DioHttpClientService.create");
    dio.options.headers = {
      HttpHeaders.acceptHeader: '*/*',
    };
    dio.interceptors.add(DioLogInterceptor());
  }

  Future<dynamic> _fetchApiPostOrDelete(
    String url, {
    CancelToken? cancelToken,
    dynamic postData,
    bool isJson = true,
    // bool isUpload = false,
    StreamController<int>? uploadProgressCtrl,
    Map<String, dynamic>? params,
    RestAction restAction = RestAction.post,
    String? contentTypeHeader,
    Options? options,
  }) {
    /*final options = Options(
      headers: {
        HttpHeaders.contentTypeHeader: isJson ? "application/json" : "application/x-www-form-urlencoded",
      },
    );*/

    if (postData != null && postData is FormData) {
      //do nothing the proper header will be set by dio plugin internally _ALL
    } else {
      final headers = {
        HttpHeaders.contentTypeHeader: isJson
            ? "application/json"
            : contentTypeHeader ?? "application/x-www-form-urlencoded",
      };
      setHeaders(headers);
    }
    return _fetchApiRestAction(
      url,
      cancelToken: cancelToken,
      // restAction: isPost ? RestAction.post : RestAction.del,
      restAction: restAction,
      // httpClient: httpClient,
      options: options,
      // isUpload: isUpload,
      params: params,
      data: postData,
    );
  }

  Future<dynamic> _fetchApiRestAction(
    String url, {
    CancelToken? cancelToken,
    RestAction restAction = RestAction.get,
    Options? options,
    dynamic data,
    Map<String, dynamic>? params,
    // bool isUpload = false,
    StreamController<int>? uploadProgressCtrl,
  }) async {
    dynamic responseJson;

    url = Uri.encodeFull(url);

    try {
      final Response response = await dio.request(
        url,
        data: data,
        options: (options ?? Options())..method = restAction.name,
        cancelToken: cancelToken,
        queryParameters: params,
      );
      responseJson = _parseApiResponse(response);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        responseJson = null;
      } else {
        if (e.error is SocketException) {
          throw ErrorNoInternetConnection();
        }
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          throw ErrorTimeoutConnection();
        } else {
          // throw ErrorNoInternetConnection();
          if (customErrorParser != null) {
            throw Exception(customErrorParser!(e.response));
          } else {
            throw Exception(e.response);
          }

          // rethrow;
        }
      }
    } catch (e, s) {
      rethrow;
      // throw UnHandledHttpException(e, s);
    }
    return responseJson;
  }

  dynamic _parseApiResponse(Response response) {
    if (response.statusCode! >= 200 && response.statusCode! <= 299) {
      return response.data;
    }

    switch (response.statusCode) {
      case 200:
      case 204:
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  void _validateReponse(Map dataMap) {
    if (customValidateResponse != null) {
      customValidateResponse!.call(dataMap);
    } else {
      /*if (dataMap["st"] != 1) {
        throw ApiException(dataMap["msg"] ?? dataMap["err"]);
      }*/
    }
  }

  @override
  void renmoveHeader(String headerKey) {
    _customHeaders?.removeWhere((key, value) => key == headerKey);
    dio.options.headers.removeWhere((key, value) => key == headerKey);
  }

  @override
  void setHeaders(Map<String, dynamic> headers) {
    _customHeaders = headers;
    dio.options.headers.addAll(headers);
    // dio.options.headers = headers;
  }

  Map<String, String> _mergedHeaders(Map<String, String>? headers) =>
      {...?_customHeaders, ...?headers};

  @override
  Future get(String url,
      {ICancelToken? cancelToken, Map<String, dynamic>? params}) {
    return _fetchApiRestAction(url,
        cancelToken: cancelToken as CancelToken?,
        restAction: RestAction.get,
        params: params);
  }

  @override
  Future post(
    String url, {
    ICancelToken? cancelToken,
    postData,
    Map<String, dynamic>? params,
    bool isJson = true,
    String? contentTypeHeader,
    StreamController<int>? uploadProgressCtrl,
  }) {
    return _fetchApiPostOrDelete(
      url,
      cancelToken: cancelToken as CancelToken?,
      postData: postData,
      params: params,
      isJson: isJson,
      restAction: RestAction.post,
      contentTypeHeader: contentTypeHeader,
      uploadProgressCtrl: uploadProgressCtrl,
    );
  }

  @override
  Future put(String url,
      {ICancelToken? cancelToken,
      postData,
      Map<String, dynamic>? params,
      bool isJson = true}) {
    return _fetchApiPostOrDelete(url,
        cancelToken: cancelToken as CancelToken?,
        postData: postData,
        params: params,
        isJson: isJson,
        restAction: RestAction.put);
  }

  @override
  Future delete(String url,
      {ICancelToken? cancelToken,
      postData,
      Map<String, dynamic>? params,
      bool isJson = true}) {
    return _fetchApiPostOrDelete(url,
        cancelToken: cancelToken as CancelToken?,
        postData: postData,
        params: params,
        isJson: isJson,
        restAction: RestAction.delete);
  }

  @override
  void setBearerToken(String token) {
    addCustomHeaderItem(HttpHeaders.authorizationHeader, 'Bearer $token');
  }

  @override
  void clearBearerToken() {
    dio.options.headers[HttpHeaders.authorizationHeader] = null;
  }

  @override
  String? getBearerToken() {
    // final regExp = RegExp(r'^(?<type>.+?)\s+(?<token>.+?)$');
    final regExp = RegExp(r'^Bearer\s+(?<token>.+?)$');
    final String authHeader =
        dio.options.headers[HttpHeaders.authorizationHeader];
    RegExpMatch? match = regExp.firstMatch(authHeader);
    String? parsedTokenValue = match?.namedGroup("token");
    return parsedTokenValue;
  }

  @override
  void addCustomHeaderItem(String key, String value) {
    dio.options.headers[key] = value;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:omnipay/modules/core/services/implementations/http/diohttpclient_service.dart';
import 'package:omnipay/modules/users/domain/entity/app_user.dart';
import 'package:omnipay/modules/users/domain/services/iuser_service.dart';
import 'package:omnipay/modules/users/infra/services/user_service.dart';
import 'package:http/http.dart' as http;
import '../../infra/datasources/i_user.datasource.dart';

class UserRemoteDataSource implements IUserDataSource {
  late DioHttpClientService _client;
  late UserService _userService;
  UserRemoteDataSource() {
    _client = DioHttpClientService();
    _userService = UserService();
  }

  String _getUrl(String actionName) {
    return "/User/$actionName";
  }

  @override
  Future<AppUser?> getUser({String? userId}) async {
    final res = await _client.get(
      _getUrl(userId == null ? "GetUserById" : "GetUser"),
      params: userId == null ? null : {"id": userId},
    );
    return res == null ? null : AppUser.fromMap(res);
  }

  @override
  Future<void> setUserInfo({AppUser? user}) {
    return _client.put(_getUrl("Update"), postData: {
      "uiud": user!.id,
      "firstName": user.firstName,
      "lastName": user.lastName,
      "amount": 0,
      "phone": user.phone
    });
  }

  @override
  Future<void> saveUser({AppUser? user, String? token}) async {
    var map = <String, dynamic>{};
    map['username'] = 'username';
    map['password'] = 'password';
    // log("OnResponse=> ${response.}");
    // _userService.onSaveUser(user!, token?? );
    // return ;
    FormData formData = FormData();
    formData = FormData.fromMap({
      "uiud": "WERFTT",
      "firstName": user!.firstName,
      "lastName": user.lastName,
      "amount": user.amount,
      "phone": user.phone
    });
    return _client.post(_getUrl("Create"), postData: formData);
  }
}

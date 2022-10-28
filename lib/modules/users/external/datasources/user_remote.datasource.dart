import 'package:dio/dio.dart';
import 'package:omnipay/modules/core/services/implementations/http/diohttpclient_service.dart';
import 'package:omnipay/modules/users/domain/entity/app_user.dart';
import 'package:omnipay/modules/users/infra/services/user_service.dart';
import '../../infra/datasources/i_user.datasource.dart';

class UserRemoteDataSource implements IUserDataSource {
  late DioHttpClientService _client;
  // ignore: unused_field
  late UserService _userService;
  UserRemoteDataSource() {
    _client = DioHttpClientService();
    _userService = UserService();
  }

  String _getUrl(String actionName) {
    return "/User/$actionName";
  }

  @override
  Future<AppUser> getUserById({String? userId}) async {
    final res = await _client.get(
      _getUrl("GetUser/$userId"),
    );

    // l.og("Response=>$res");
    return AppUser.fromMap(res["user"]);
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
  Future<void> saveUser({AppUser? user}) async {
    var map = <String, dynamic>{};
    map['username'] = 'username';
    map['password'] = 'password';
    // log("OnResponse=> ${response.}");
    // _userService.onSaveUser(user!, token?? );
    // return ;
    FormData formData = FormData();
    formData = FormData.fromMap({
      "uiud": user!.id,
      "firstName": user.firstName,
      "lastName": user.lastName,
      "amount": user.amount,
      "phone": user.phone
    });
    return _client.post(_getUrl("Create"), postData: formData);
  }
}

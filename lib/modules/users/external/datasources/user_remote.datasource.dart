import 'package:omnipay/modules/users/domain/entity/app_user.dart';

import '../../../core/services/interfaces/ihttpclient_service.dart';
import '../../infra/datasources/i_user.datasource.dart';

class UserRemoteDataSource implements IUserDataSource {
  final IHttpClientService _client;
  UserRemoteDataSource(this._client);

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
    return _client.put(_getUrl("Update"), postData: {"user": user});
  }
}

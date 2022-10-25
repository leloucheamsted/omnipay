import 'dart:developer';

import 'package:omnipay/modules/users/domain/entity/app_user.dart';
import 'package:omnipay/modules/users/domain/repositories/i_session.repo.dart';
import 'package:omnipay/modules/users/domain/services/iuser_service.dart';

class UserService implements IuserService {
  late ISessionRepo repo;
  @override
  Future<AppUser> onSaveUser(AppUser user, String token) async {
    repo.saveToken(token);
    repo.saveUser(user);
    log("Token=> $token");
    return user;
  }
}

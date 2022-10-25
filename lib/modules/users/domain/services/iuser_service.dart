import 'package:omnipay/modules/users/domain/entity/app_user.dart';

abstract class IuserService {
  Future<AppUser> onSaveUser(AppUser user, String token);
}

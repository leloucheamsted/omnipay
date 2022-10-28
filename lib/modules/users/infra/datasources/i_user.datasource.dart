import '../../domain/entity/app_user.dart';

abstract class IUserDataSource {
  Future<void> setUserInfo({AppUser? user});
  Future<void> saveUser({AppUser? user});
  Future<AppUser?> getUserById({String? userId});
}

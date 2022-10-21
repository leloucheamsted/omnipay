import '../../domain/entity/app_user.dart';

abstract class IUserDataSource {
  Future<void> setUserInfo({AppUser? user});
  Future<AppUser?> getUser({String? userId});
}

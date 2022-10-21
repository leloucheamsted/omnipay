import '../../domain/entity/app_user.dart';

abstract class ISessionDataSource {
  Future<bool> get isExists;
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> saveUser(AppUser user);
  Future<void> clearSession();
}

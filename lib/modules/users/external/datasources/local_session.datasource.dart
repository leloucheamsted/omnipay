import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:omnipay/modules/users/domain/entity/app_user.dart';

import '../../infra/datasources/i_session.datasource.dart';

class LocalSessionDataSource implements ISessionDataSource {
  late final FlutterSecureStorage _secureStorage;

  static const String tokenKey = "paymateToken";
  static const String phoneKey = "paymatePhone";
  LocalSessionDataSource() {
    _secureStorage = const FlutterSecureStorage();
  }

  @override
  Future<void> clearSession() async {
    await _secureStorage.delete(key: phoneKey);
    return _secureStorage.delete(key: tokenKey);
  }

  @override
  Future<String?> getToken() => _secureStorage.read(key: tokenKey);

  @override
  Future<bool> get isExists async {
    final String? token = await getToken();
    return token != null;
  }

  @override
  Future<void> saveToken(String token) {
    log(token);
    return _secureStorage.write(key: tokenKey, value: token);
  }

  @override
  Future<void> saveUser(AppUser user) {
    _secureStorage.write(key: 'idKey', value: user.id);
    _secureStorage.write(key: 'firstNameKey', value: user.firstName);
    _secureStorage.write(key: 'lastNameKey', value: user.lastName);
    _secureStorage.write(key: phoneKey, value: user.phone);
    _secureStorage.write(key: 'amountKey', value: user.amount.toString());
    return _secureStorage.write(key: 'idKey', value: user.id);
  }

  @override
  Future<AppUser?> getUser() async {
    AppUser user = AppUser(
        id: _secureStorage.read(key: 'idKey').toString(),
        firstName: _secureStorage.read(key: 'firstNameKey').toString(),
        lastName: _secureStorage.read(key: 'lastNameKey').toString(),
        amount: int.parse(_secureStorage.read(key: 'amountkey').toString()),
        phone: _secureStorage.read(key: 'phonekey').toString());

    return user;
  }
}

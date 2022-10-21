import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/users/domain/entity/app_user.dart';

import '../../../core/error/failure.dart';

abstract class ISessionRepo {
  Future<Either<IFailure, bool>> get isExists;
  Future<Either<IFailure, void>> saveToken(String token);
  Future<Either<IFailure, String?>> getToken();
  Future<Either<IFailure, void>> saveUser(AppUser user);
  Future<Either<IFailure, void>> clearSession();
}

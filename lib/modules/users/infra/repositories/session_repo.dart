import 'package:omnipay/modules/users/domain/entity/app_user.dart';
import 'package:omnipay/modules/users/external/datasources/local_session.datasource.dart';

import '../../../core/error/failure.dart';
import '../../../core/repositories/base_repo.dart';
import '../../domain/repositories/i_session.repo.dart';

class SessionRepo extends BaseRepo implements ISessionRepo {
  late LocalSessionDataSource localDataSource;
  SessionRepo() {
    localDataSource = LocalSessionDataSource();
  }

  @override
  Future<Either<IFailure, void>> clearSession() {
    return runWithEither(() => localDataSource.clearSession());
  }

  @override
  Future<Either<IFailure, String?>> getToken() {
    return runWithEither(() => localDataSource.getToken());
  }

  @override
  Future<Either<IFailure, bool>> get isExists =>
      runWithEither(() => localDataSource.isExists);

  @override
  Future<Either<IFailure, void>> saveToken(String token) {
    return runWithEither(() => localDataSource.saveToken(token));
  }

  @override
  Future<Either<IFailure, AppUser?>> getUser() {
    return runWithEither(() => localDataSource.getUser());
  }

  @override
  Future<Either<IFailure, void>> saveUser(AppUser user) {
    return runWithEither(() => localDataSource.saveUser(user));
  }
}

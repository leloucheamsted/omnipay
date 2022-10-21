import 'package:omnipay/modules/users/domain/entity/app_user.dart';

import '../../../core/error/failure.dart';
import '../../../core/repositories/base_repo.dart';
import '../../domain/repositories/i_session.repo.dart';
import '../datasources/i_session.datasource.dart';

class SessionRepo extends BaseRepo implements ISessionRepo {
  final ISessionDataSource localDataSource;
  SessionRepo(this.localDataSource);

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
  Future<Either<IFailure, void>> saveUser(AppUser user) {
    return runWithEither(() => localDataSource.saveUser(user));
  }
}

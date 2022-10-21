import '../../../core/error/failure.dart';
import '../../../core/repositories/base_repo.dart';
import '../../domain/entity/app_user.dart';
import '../../domain/repositories/iuser_repo.dart';
import '../datasources/i_user.datasource.dart';

class UserRepo extends BaseRepo implements IUserRepo {
  final IUserDataSource remoteDataSource;
  UserRepo(this.remoteDataSource);

  @override
  Future<Either<IFailure, void>> setUserInfo({AppUser? user}) {
    return runWithEither(() => remoteDataSource.setUserInfo(user: user));
  }

  @override
  Future<Either<IFailure, AppUser?>> getUser({String? userId}) {
    return runWithEither(() => remoteDataSource.getUser(userId: userId));
  }
}

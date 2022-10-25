import '../../../core/error/failure.dart';
import '../../../core/repositories/base_repo.dart';
import '../../domain/entity/app_user.dart';
import '../../domain/repositories/iuser_repo.dart';
import '../../external/datasources/user_remote.datasource.dart';
import '../datasources/i_user.datasource.dart';

class UserRepo extends BaseRepo implements IUserRepo {
  late UserRemoteDataSource remoteDataSource;
  UserRepo() {
    remoteDataSource = UserRemoteDataSource();
  }

  @override
  Future<Either<IFailure, void>> saveUser({AppUser? user}) {
    return runWithEither(() => remoteDataSource.saveUser(user: user));
  }

  @override
  Future<Either<IFailure, AppUser?>> getUser({String? userId}) {
    return runWithEither(() => remoteDataSource.getUser(userId: userId));
  }
}

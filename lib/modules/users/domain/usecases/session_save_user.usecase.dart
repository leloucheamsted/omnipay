import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/users/domain/entity/app_user.dart';
import 'package:omnipay/modules/users/domain/repositories/iuser_repo.dart';
import 'package:omnipay/modules/users/infra/repositories/user.repo.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';
import '../repositories/i_session.repo.dart';

class SessionSaveUserUsecase implements IUseCase<void, AppUser> {
  late UserRepo _repo;
  SessionSaveUserUsecase() {
    _repo = UserRepo();
  }

  @override
  Future<Either<IFailure, void>> call(AppUser user) {
    return _repo.saveUser(user: user);
  }
}

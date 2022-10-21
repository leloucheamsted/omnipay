import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/users/domain/entity/app_user.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';
import '../repositories/i_session.repo.dart';

class SessionSaveUserUsecase implements IUseCase<void, AppUser> {
  final ISessionRepo _repo;
  SessionSaveUserUsecase(this._repo);

  @override
  Future<Either<IFailure, void>> call(AppUser user) {
    return _repo.saveUser(user);
  }
}

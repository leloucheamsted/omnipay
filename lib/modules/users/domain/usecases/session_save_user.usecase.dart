import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/users/domain/entity/app_user.dart';
import 'package:omnipay/modules/users/infra/repositories/session_repo.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';

class SessionSaveUserUsecase implements IUseCase<void, AppUser> {
  late SessionRepo _repo;
  SessionSaveUserUsecase() {
    _repo = SessionRepo();
  }

  @override
  Future<Either<IFailure, void>> call(AppUser user) {
    log("User=> $user");
    return _repo.saveUser(user);
  }
}

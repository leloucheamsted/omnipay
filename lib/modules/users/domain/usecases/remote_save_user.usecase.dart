import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/users/domain/entity/app_user.dart';
import 'package:omnipay/modules/users/infra/repositories/user.repo.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';

class RemoteSaveUserUsecase implements IUseCase<void, AppUser> {
  late UserRepo _repo;
  RemoteSaveUserUsecase() {
    _repo = UserRepo();
  }

  @override
  Future<Either<IFailure, void>> call(AppUser user) {
    log("User=> $user");
    return _repo.saveUser(user: user);
  }
}

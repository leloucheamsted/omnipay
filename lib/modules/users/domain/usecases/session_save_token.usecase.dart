import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/users/infra/repositories/session_repo.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';

class SessionSaveTokenUsecase implements IUseCase<void, String> {
  late SessionRepo _repo;
  SessionSaveTokenUsecase() {
    _repo = SessionRepo();
  }

  @override
  Future<Either<IFailure, void>> call(String token) {
    return _repo.saveToken(token);
  }
}

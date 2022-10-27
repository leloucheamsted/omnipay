import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/users/infra/repositories/session_repo.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';

class SessionReadTokenUsecase implements IUseCase<String?, void> {
  late SessionRepo _repo;
  SessionReadTokenUsecase() {
    _repo = SessionRepo();
  }

  @override
  Future<Either<IFailure, String?>> call(void params) {
    return _repo.getToken();
  }
}

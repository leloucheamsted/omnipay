import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';
import '../repositories/i_session.repo.dart';

class SessionReadTokenUsecase implements IUseCase<String?, void> {
  final ISessionRepo _repo;
  SessionReadTokenUsecase(this._repo);

  @override
  Future<Either<IFailure, String?>> call(void params) {
    return _repo.getToken();
  }
}

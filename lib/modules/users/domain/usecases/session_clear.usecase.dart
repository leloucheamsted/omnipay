import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';
import '../repositories/i_session.repo.dart';

class SessionClearUseCase implements IUseCase<void, void> {
  final ISessionRepo _repo;
  SessionClearUseCase(this._repo);

  @override
  Future<Either<IFailure, void>> call(void params) {
    return _repo.clearSession();
  }
}

import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';
import '../repositories/i_session.repo.dart';

class SessionExistsUseCase implements IUseCase<bool, void> {
  final ISessionRepo _repo;
  SessionExistsUseCase(this._repo);

  @override
  Future<Either<IFailure, bool>> call(void params) {
    return _repo.isExists;
  }
}

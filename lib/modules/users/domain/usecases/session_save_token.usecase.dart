import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';
import '../repositories/i_session.repo.dart';

class SessionSaveTokenUsecase implements IUseCase<void, String> {
  final ISessionRepo _repo;
  SessionSaveTokenUsecase(this._repo);

  @override
  Future<Either<IFailure, void>> call(String token) {
    return _repo.saveToken(token);
  }
}

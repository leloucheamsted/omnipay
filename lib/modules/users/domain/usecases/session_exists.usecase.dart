import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';
import '../../infra/repositories/session_repo.dart';
import '../repositories/i_session.repo.dart';

class SessionExistsUseCase implements IUseCase<bool, void> {
  late SessionRepo repo;
  SessionExistsUseCase() {
    repo = SessionRepo();
  }

  @override
  Future<Either<IFailure, bool>> call(void params) {
    return repo.isExists;
  }
}

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';
import '../../infra/repositories/session_repo.dart';

class SessionClearUseCase implements IUseCase<void, void> {
  late SessionRepo repo;

  SessionClearUseCase() {
    repo = SessionRepo();
  }

  @override
  Future<Either<IFailure, void>> call(void params) {
    return repo.clearSession();
  }
}

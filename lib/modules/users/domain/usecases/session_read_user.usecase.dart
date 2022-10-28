import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';
import '../../infra/repositories/user.repo.dart';
import '../entity/app_user.dart';

class SessionReadUserUsecase implements IUseCase<AppUser, String?> {
  late UserRepo _repo;

  SessionReadUserUsecase() {
    _repo = UserRepo();
  }

  @override
  Future<Either<IFailure, AppUser>> call(String? userId) async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    final userId = await secureStorage.read(key: 'idKey');
    return _repo.getUser(userId: userId);
  }
}

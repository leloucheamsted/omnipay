import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entity/app_user.dart';

abstract class IUserRepo {
  Future<Either<IFailure, void>> saveUser({AppUser user});
  Future<Either<IFailure, AppUser?>> getUser({String? userId});
}

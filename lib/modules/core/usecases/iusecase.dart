import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class IUseCase<OutPut, Input> {
  // Future<Either<IFailure, OutPut>> call([Input? params]);
  Future<Either<IFailure, OutPut>> call(Input params);
}

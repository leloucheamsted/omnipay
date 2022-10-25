import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/transactions/domain/entity/transaction.entity.dart';

import '../../../core/error/failure.dart';

abstract class ITransactionsRepo {
  // fectch transaction of user
  Future<Either<IFailure, List<TransactionEntity>>> fetchLatestTransactions(
      {String userId});
  Future<Either<IFailure, List<TransactionEntity>>> fetchAllTransactions(
      {String userId});
}

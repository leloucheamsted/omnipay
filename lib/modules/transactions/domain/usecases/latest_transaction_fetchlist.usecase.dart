import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';
import '../../infra/repositories/transactions.repository.dart';
import '../entity/transaction.entity.dart';

class LatestTransactionFetchListUseCase
    implements IUseCase<List<TransactionEntity>, String> {
  late TransactionsRepository repo;

  TransactionFetchListUseCase() {
    repo = TransactionsRepository();
  }

  @override
  Future<Either<IFailure, List<TransactionEntity>>> call(String userId) {
    return repo.fetchLatestTransactions(userId: userId);
  }
}

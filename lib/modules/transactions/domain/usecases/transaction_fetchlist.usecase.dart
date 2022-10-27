import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/transactions/domain/entity/transaction.entity.dart';
import 'package:omnipay/modules/transactions/infra/repositories/transactions.repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';

class TransactionFetchListUseCase
    implements IUseCase<List<TransactionEntity>, String> {
  late TransactionsRepository repo;

  TransactionFetchListUseCase() {
    repo = TransactionsRepository();
  }
  @override
  Future<Either<IFailure, List<TransactionEntity>>> call(String userId) {
    return repo.fetchAllTransactions(userId: userId);
  }
}

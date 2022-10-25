import 'package:omnipay/modules/core/error/failure.dart';
import 'package:omnipay/modules/core/repositories/base_repo.dart';
import 'package:omnipay/modules/transactions/domain/entity/transaction.entity.dart';
import 'package:omnipay/modules/transactions/domain/repositories/i_transaction.repo.dart';
import 'package:omnipay/modules/transactions/external/datasource/remote_transactions.datasource.dart';

class TransactionsRepository extends BaseRepo implements ITransactionsRepo {
  late RemoteTransactionsDataSource remoteDataSource;
  TransactionsRepository() {
    remoteDataSource = RemoteTransactionsDataSource();
  }
  @override
  Future<Either<IFailure, List<TransactionEntity>>> fetchAllTransactions(
      {String? userId}) {
    return runWithEither(
        () => remoteDataSource.fetchAllTransactions(userId: userId));
  }

  @override
  Future<Either<IFailure, List<TransactionEntity>>> fetchLatestTransactions(
      {String? userId}) {
    return runWithEither(
        () => remoteDataSource.fetchLatestTransactions(userId: userId));
  }
}

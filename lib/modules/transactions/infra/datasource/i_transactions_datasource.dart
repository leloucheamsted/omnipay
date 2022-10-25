import 'package:omnipay/modules/transactions/domain/entity/transaction.entity.dart';

abstract class ITransactionDataSource {
  Future<List<TransactionEntity>> fetchAllTransactions({String? userId});
  Future<List<TransactionEntity>> fetchLatestTransactions({String? userId});

  //fetch user related groups either owner or a member of

}

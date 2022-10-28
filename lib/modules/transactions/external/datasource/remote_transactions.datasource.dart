import 'package:omnipay/modules/transactions/domain/entity/transaction.entity.dart';

import '../../../core/services/implementations/http/diohttpclient_service.dart';
import '../../infra/datasource/i_transactions_datasource.dart';

class RemoteTransactionsDataSource implements ITransactionDataSource {
  late DioHttpClientService _client;
  // late UserService _userService;
  RemoteTransactionsDataSource() {
    _client = DioHttpClientService();
  }
  String _getUrl(String actionName) {
    return "/GetUser/$actionName";
  }

  @override
  Future<List<TransactionEntity>> fetchAllTransactions({String? userId}) async {
    final response = await _client.get(_getUrl("/AllTransactions/$userId"));
    return List<TransactionEntity>.from(
        response.map((x) => TransactionEntity.fromMap(x)));
  }

  @override
  Future<List<TransactionEntity>> fetchLatestTransactions(
      {String? userId}) async {
    final response = await _client.get(_getUrl("/LatestTransactions/$userId"));
    return List<TransactionEntity>.from(
        response.map((x) => TransactionEntity.fromMap(x)));
  }
}

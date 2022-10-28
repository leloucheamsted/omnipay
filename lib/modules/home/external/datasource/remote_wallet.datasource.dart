import 'package:dio/dio.dart';
import 'package:omnipay/modules/home/domain/entity/request_wallet.entity.dart';
import 'package:omnipay/modules/home/domain/entity/reload_wallet.entity.dart';
import 'package:omnipay/modules/home/infra/datasource/i_wallet.datasource.dart';
import 'package:omnipay/modules/transactions/domain/entity/transaction.entity.dart';

import '../../../core/services/implementations/http/diohttpclient_service.dart';

class RemoteWalletDataSource implements IWalletDataSource {
  late DioHttpClientService _client;
  // late UserService _userService;
  RemoteWalletDataSource() {
    _client = DioHttpClientService();
  }
  String _getUrl(String actionName) {
    return "/Wallet/$actionName";
  }

  @override
  Future<TransactionEntity> confirmReload({String? transactionId}) async {
    final response =
        await _client.get(_getUrl("/Reload/Confirm/:$transactionId"));
    return TransactionEntity.fromMap(response["data"]);
  }

  @override
  Future<ReloadWalletEntity> reloadWallet({RequestWalletEntity? params}) async {
    // ignore: unused_local_variable
    FormData formData = FormData();
    formData = FormData.fromMap({
      "userId": params!.userId,
      "phone": params.phone,
      "amount": params.amount,
      "email": params.email,
    });
    final response = await _client.post(_getUrl("/Reload"), postData: formData);
    return ReloadWalletEntity.fromMap(response["data"]);
  }
}

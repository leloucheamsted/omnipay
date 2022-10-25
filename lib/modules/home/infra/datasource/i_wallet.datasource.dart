import 'package:omnipay/modules/home/domain/entity/reload_wallet.entity.dart';
import 'package:omnipay/modules/transactions/domain/entity/transaction.entity.dart';

import '../../domain/entity/request_wallet.entity.dart';

abstract class IWalletDataSource {
  Future<ReloadWalletEntity> reloadWallet({RequestWalletEntity params});
  Future<TransactionEntity> confirmReload({String transactionId});

  //fetch user related groups either owner or a member of

}

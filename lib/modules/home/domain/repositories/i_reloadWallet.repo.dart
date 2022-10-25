import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/home/domain/entity/reload_wallet.entity.dart';
import 'package:omnipay/modules/home/domain/entity/request_wallet.entity.dart';

import '../../../core/error/failure.dart';
import '../../../transactions/domain/entity/transaction.entity.dart';

abstract class IReloadWalletRepo {
  Future<Either<IFailure, ReloadWalletEntity>> reloadWallet(
      {RequestWalletEntity params});
  Future<Either<IFailure, TransactionEntity>> confirmReload(
      {String transactionId});
}

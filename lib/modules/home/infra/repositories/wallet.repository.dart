import 'package:omnipay/modules/home/domain/entity/request_wallet.entity.dart';
import 'package:omnipay/modules/home/domain/entity/reload_wallet.entity.dart';
import 'package:omnipay/modules/core/error/failure.dart';
import 'package:omnipay/modules/home/domain/repositories/i_reloadWallet.repo.dart';
import 'package:omnipay/modules/home/external/datasource/remote_wallet.datasource.dart';
import 'package:omnipay/modules/transactions/domain/entity/transaction.entity.dart';

import '../../../core/repositories/base_repo.dart';

class WalletRepository extends BaseRepo implements IReloadWalletRepo {
  late RemoteWalletDataSource remoteDataSource;
  WalletRepository() {
    remoteDataSource = RemoteWalletDataSource();
  }
  @override
  Future<Either<IFailure, TransactionEntity>> confirmReload(
      {String? transactionId}) {
    return runWithEither(
        () => remoteDataSource.confirmReload(transactionId: transactionId));
  }

  @override
  Future<Either<IFailure, ReloadWalletEntity>> reloadWallet(
      {RequestWalletEntity? params}) {
    return runWithEither(() => remoteDataSource.reloadWallet(params: params));
  }
}

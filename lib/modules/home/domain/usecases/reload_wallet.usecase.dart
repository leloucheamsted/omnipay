import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/home/domain/entity/reload_wallet.entity.dart';
import 'package:omnipay/modules/home/infra/repositories/wallet.repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';
import '../entity/request_wallet.entity.dart';

class ReloadWalletUseCase
    implements IUseCase<ReloadWalletEntity, RequestWalletEntity> {
  late WalletRepository repo;

  ReloadWalletUseCase() {
    repo = WalletRepository();
  }
  @override
  Future<Either<IFailure, ReloadWalletEntity>> call(
      RequestWalletEntity params) {
    return repo.reloadWallet(params: params);
  }
}

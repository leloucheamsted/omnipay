import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/transactions/domain/entity/transaction.entity.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';
import '../../infra/repositories/wallet.repository.dart';

class ConfirmReloadWalletUseCase
    implements IUseCase<TransactionEntity, String> {
  late WalletRepository repo;

  ConfirmReloadWalletUseCase() {
    repo = WalletRepository();
  }
  @override
  Future<Either<IFailure, TransactionEntity>> call(String id) {
    return repo.confirmReload(transactionId: id);
  }
}

import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/card/domain/entity/card_details.entity.dart';
import 'package:omnipay/modules/card/domain/entity/reload_card.entity.dart';
import 'package:omnipay/modules/card/infra/repositories/card.repository.dart';
import 'package:omnipay/modules/users/domain/entity/app_user.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';

class ReloadCardUseCase
    implements IUseCase<CardDetailsEntity, ReloadCardEntity> {
  late CardRepository repo;

  ReloadCardUseCase() {
    repo = CardRepository();
  }
  @override
  Future<Either<IFailure, CardDetailsEntity>> call(
      ReloadCardEntity reloadCardEntity) {
    return repo.reloadCard(reloadCardEntity: reloadCardEntity);
  }
}

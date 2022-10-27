import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/card/domain/entity/card_details.entity.dart';
import 'package:omnipay/modules/card/infra/repositories/card.repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';

class DetailsCardUseCase implements IUseCase<CardDetailsEntity, String> {
  late CardRepository repo;

  DetailsCardUseCase() {
    repo = CardRepository();
  }
  @override
  Future<Either<IFailure, CardDetailsEntity>> call(String id) {
    return repo.getCardDetails(cardId: id);
  }
}

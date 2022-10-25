import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/card/domain/entity/card_details.entity.dart';
import 'package:omnipay/modules/card/infra/repositories/card.repository.dart';
import 'package:omnipay/modules/users/domain/entity/app_user.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/iusecase.dart';

class CreateCardUseCase implements IUseCase<CardDetailsEntity, AppUser> {
  late CardRepository repo;

  CreateCardUseCase() {
    repo = CardRepository();
  }
  @override
  Future<Either<IFailure, CardDetailsEntity>> call(AppUser user) {
    return repo.createCard(user: user);
  }
}

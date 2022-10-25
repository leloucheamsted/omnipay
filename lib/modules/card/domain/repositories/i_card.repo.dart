import 'package:dartz/dartz.dart';
import 'package:omnipay/modules/card/domain/entity/card_details.entity.dart';
import 'package:omnipay/modules/card/domain/entity/reload_card.entity.dart';

import '../../../core/error/failure.dart';
import '../../../users/domain/entity/app_user.dart';

abstract class ICardRepo {
  Future<Either<IFailure, CardDetailsEntity>> createCard({AppUser user});
  Future<Either<IFailure, CardDetailsEntity>> reloadCard(
      {ReloadCardEntity reloadCardEntity});
  Future<Either<IFailure, CardDetailsEntity>> getCardDetails({String cardId});
}

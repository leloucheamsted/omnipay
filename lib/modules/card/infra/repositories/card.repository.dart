import 'package:omnipay/modules/card/domain/entity/reload_card.entity.dart';
import 'package:omnipay/modules/card/domain/entity/card_details.entity.dart';
import 'package:omnipay/modules/card/domain/repositories/i_card.repo.dart';
import 'package:omnipay/modules/card/external/datasource/remote_card.datasource.dart';
import 'package:omnipay/modules/users/domain/entity/app_user.dart';
import 'package:omnipay/modules/core/error/failure.dart';

import '../../../core/repositories/base_repo.dart';

class CardRepository extends BaseRepo implements ICardRepo {
  late RemoteCardDataSource remoteDataSource;
  // ignore: non_constant_identifier_names
  WalletRepository() {
    remoteDataSource = RemoteCardDataSource();
  }

  @override
  Future<Either<IFailure, CardDetailsEntity>> createCard({AppUser? user}) {
    return runWithEither(() => remoteDataSource.createCard(user: user));
  }

  @override
  Future<Either<IFailure, CardDetailsEntity>> getCardDetails({String? cardId}) {
    return runWithEither(() => remoteDataSource.getCardDetails(cardId: cardId));
  }

  @override
  Future<Either<IFailure, CardDetailsEntity>> reloadCard(
      {ReloadCardEntity? reloadCardEntity}) {
    return runWithEither(
        () => remoteDataSource.reloadCard(reloadCardEntity: reloadCardEntity));
  }
}

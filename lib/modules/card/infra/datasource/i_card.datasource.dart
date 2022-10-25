import '../../../users/domain/entity/app_user.dart';
import '../../domain/entity/card_details.entity.dart';
import '../../domain/entity/reload_card.entity.dart';

abstract class ICardDataSource {
  Future<CardDetailsEntity> createCard({AppUser user});
  Future<CardDetailsEntity> reloadCard({ReloadCardEntity reloadCardEntity});
  Future<CardDetailsEntity> getCardDetails({String cardId});
}

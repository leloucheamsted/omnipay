import 'package:dio/dio.dart';
import 'package:omnipay/modules/card/domain/entity/reload_card.entity.dart';
import 'package:omnipay/modules/card/domain/entity/card_details.entity.dart';
import 'package:omnipay/modules/card/infra/datasource/i_card.datasource.dart';
import 'package:omnipay/modules/users/domain/entity/app_user.dart';

import '../../../core/services/implementations/http/diohttpclient_service.dart';

class RemoteCardDataSource implements ICardDataSource {
  late DioHttpClientService _client;
  // late UserService _userService;
  RemoteCardDataSource() {
    _client = DioHttpClientService();
  }
  String _getUrl(String actionName) {
    return "/Card/$actionName";
  }

  @override
  Future<CardDetailsEntity> createCard({AppUser? user}) async {
    FormData formData = FormData();
    formData = FormData.fromMap({
      "uiud": user!.id,
      "firstName": user.firstName,
      "lastName": user.lastName,
      "amount": user.amount,
      "phone": user.phone
    });
    final response = await _client.post(_getUrl("Create"), postData: formData);
    return CardDetailsEntity.fromMap(response["data"]["data"]);
  }

  @override
  Future<CardDetailsEntity> getCardDetails({String? cardId}) async {
    final response = await _client.get(_getUrl("Create"));
    return CardDetailsEntity.fromMap(response["data"]["data"]);
  }

  @override
  Future<CardDetailsEntity> reloadCard(
      {ReloadCardEntity? reloadCardEntity}) async {
    FormData formData = FormData();
    formData = FormData.fromMap({
      "card_id": reloadCardEntity!.cardID,
      "amount": reloadCardEntity.amount,
      "user_Id": reloadCardEntity.userID,
    });
    final response = await _client.post(_getUrl("Reload"), postData: formData);
    return CardDetailsEntity.fromMap(response["data"]["data"]);
  }
}

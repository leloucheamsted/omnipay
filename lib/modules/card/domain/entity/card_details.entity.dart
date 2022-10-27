import 'package:omnipay/modules/card/domain/entity/card_address.entity.dart';
import 'package:omnipay/modules/card/domain/entity/card_meta.entity.dart';

class CardDetailsEntity {
  final String balance;
  final CardAddressEntity billingAddress;
  final String brand;
  final String cardCurrency;
  final String cardId;
  final String cardName;
  final String cardNumber;
  final String cardType;
  final String cardholderId;
  final String createdAt;
  final String cvv;
  final String expiryMonth;
  final String expiryYear;
  final String isActive;
  final String issuingAppId;
  final String last4;
  final String liveMode;
  final CardMetaEntity metaData;

  CardDetailsEntity({
    required this.balance,
    required this.billingAddress,
    required this.brand,
    required this.cardCurrency,
    required this.cardId,
    required this.cardName,
    required this.cardNumber,
    required this.cardType,
    required this.cardholderId,
    required this.createdAt,
    required this.cvv,
    required this.expiryMonth,
    required this.expiryYear,
    required this.isActive,
    required this.issuingAppId,
    required this.last4,
    required this.liveMode,
    required this.metaData,
  });

  Map<String, dynamic> toMap() {
    return {
      "balance": balance,
      "billing_address": billingAddress,
      "brand": brand,
      "card_currency": cardCurrency,
      "card_id": cardId,
      "card_name": cardName,
      "card_number": cardNumber,
      "card_type": cardType,
      "cardholder_id": cardholderId,
      "created_at": createdAt,
      "cvv": cvv,
      "expiry_month": expiryMonth,
      "expiry_year": expiryYear,
      "is_active": isActive,
      "issuing_app_id": issuingAppId,
      "last_4": last4,
      "livemode": liveMode,
      "meta_data": metaData
    };
  }

  factory CardDetailsEntity.fromMap(Map<String, dynamic> map) {
    return CardDetailsEntity(
      balance: map["balance"] ?? '',
      billingAddress: map["billing_address"] ?? '',
      brand: map["brand"] ?? '',
      cardCurrency: map["card_currency"] ?? '',
      cardId: map["card_id"] ?? '',
      cardName: map["card_name"] ?? '',
      cardNumber: map["card_number"] ?? '',
      cardType: map["card_type"] ?? '',
      cardholderId: map["cardholder_id"] ?? '',
      createdAt: map["created_at"] ?? '',
      cvv: map["cvv"] ?? '',
      expiryMonth: map["expiry_month"] ?? '',
      expiryYear: map["expiry_year"] ?? '',
      isActive: map["is_active"] ?? '',
      issuingAppId: map["issuing_app_id"] ?? '',
      last4: map["last_4"] ?? '',
      liveMode: map["livemode"] ?? '',
      metaData: map["meta_data"] ?? '',
    );
  }

  @override
  String toString() {
    return 'CardDetailsEntity(balance: $balance, billingAddress: $billingAddress, brand: $brand, cardCurrency: $cardCurrency, cardId: $cardId, cardName: $cardName, cardNumber: $cardNumber, cardType: $cardType, cardholderId: $cardholderId, createdAt: $createdAt, cvv: $cvv, expiryMonth: $expiryMonth, expiryYear: $expiryYear, isActive: $isActive, issuingAppId: $issuingAppId, last4: $last4, liveMode: $liveMode, metaData: $metaData )';
  }

  @override
  // ignore: hash_and_equals
  int get hashCode {
    return balance.hashCode ^
        billingAddress.hashCode ^
        brand.hashCode ^
        cardCurrency.hashCode ^
        cardId.hashCode ^
        cardName.hashCode ^
        cardNumber.hashCode ^
        cardType.hashCode ^
        cardholderId.hashCode ^
        createdAt.hashCode ^
        cvv.hashCode ^
        expiryMonth.hashCode ^
        expiryYear.hashCode ^
        isActive.hashCode ^
        issuingAppId.hashCode ^
        last4.hashCode ^
        liveMode.hashCode ^
        metaData.hashCode;
  }

  CardDetailsEntity copyWith({
    String? balance,
    CardAddressEntity? billingAddress,
    String? brand,
    String? cardCurrency,
    String? cardId,
    String? cardName,
    String? cardNumber,
    String? cardType,
    String? cardholderId,
    String? createdAt,
    String? cvv,
    String? expiryMonth,
    String? expiryYear,
    String? isActive,
    String? issuingAppId,
    String? last4,
    String? liveMode,
    CardMetaEntity? metaData,
  }) {
    return CardDetailsEntity(
      balance: balance ?? this.balance,
      billingAddress: billingAddress ?? this.billingAddress,
      brand: brand ?? this.brand,
      cardCurrency: cardCurrency ?? this.cardCurrency,
      cardId: cardId ?? this.cardId,
      cardName: cardName ?? this.cardName,
      cardNumber: cardNumber ?? this.cardNumber,
      cardType: cardType ?? this.cardType,
      cardholderId: cardholderId ?? this.cardholderId,
      createdAt: createdAt ?? this.createdAt,
      cvv: cvv ?? this.cvv,
      expiryMonth: expiryMonth ?? this.expiryMonth,
      expiryYear: expiryYear ?? this.expiryYear,
      isActive: isActive ?? this.isActive,
      issuingAppId: issuingAppId ?? this.issuingAppId,
      last4: last4 ?? this.last4,
      liveMode: liveMode ?? this.liveMode,
      metaData: metaData ?? this.metaData,
    );
  }
}

class CardAddressEntity {
  final String billingAddress1;
  final String billingCity;
  final String billingCountry;
  final String billingZipCode;
  final String countryCode;

  CardAddressEntity({
    required this.billingAddress1,
    required this.billingCity,
    required this.billingCountry,
    required this.billingZipCode,
    required this.countryCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'billing_address1': billingAddress1,
      'billing_city': billingCity,
      'billing_country': billingCountry,
      'billing_zip_code': billingZipCode,
      'country_code': countryCode
    };
  }

  factory CardAddressEntity.fromMap(Map<String, dynamic> map) {
    return CardAddressEntity(
        billingAddress1: map['billing_address1'] ?? '',
        billingCity: map['billingCity'] ?? '',
        billingCountry: map['billingCountry'] ?? '',
        billingZipCode: map['billing_zip_code'] ?? '',
        countryCode: map['country_code'] ?? '');
  }

  @override
  String toString() {
    return 'GroupEntity(billingAddress1: $billingAddress1, billingCity: $billingCity, billingCountry: $billingCountry,billingZipCode: $billingZipCode, countryCode: $countryCode )';
  }

  @override
  // ignore: hash_and_equals
  int get hashCode {
    return billingAddress1.hashCode ^
        billingCity.hashCode ^
        billingCountry.hashCode ^
        billingZipCode.hashCode ^
        countryCode.hashCode;
  }

  CardAddressEntity copyWith({
    String? billingAddress1,
    String? billingCity,
    String? billingCountry,
    String? billingZipCode,
    String? countryCode,
  }) {
    return CardAddressEntity(
        billingAddress1: billingAddress1 ?? this.billingAddress1,
        billingCity: billingCity ?? this.billingCity,
        billingCountry: billingCountry ?? this.billingCountry,
        billingZipCode: billingZipCode ?? this.billingZipCode,
        countryCode: countryCode ?? this.countryCode);
  }
}

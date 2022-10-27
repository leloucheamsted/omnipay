class ReloadCardEntity {
  final String cardID;
  final String amount;
  final String userID;

  ReloadCardEntity({
    required this.userID,
    required this.cardID,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'card_id': userID,
      'amount': cardID,
      'user_Id': amount,
    };
  }

  factory ReloadCardEntity.fromMap(Map<String, dynamic> map) {
    return ReloadCardEntity(
      userID: map['user_Id'] ?? '',
      cardID: map['card_id'] ?? '',
      amount: map['amount'] ?? '',
    );
  }

  @override
  String toString() {
    return 'GroupEntity(userID: $userID, amount: $amount, cardID: $cardID)';
  }

  @override
  // ignore: hash_and_equals
  int get hashCode {
    return userID.hashCode ^ cardID.hashCode ^ amount.hashCode;
  }

  ReloadCardEntity copyWith({
    String? userID,
    String? cardID,
    String? amount,
  }) {
    return ReloadCardEntity(
        userID: userID ?? this.userID,
        cardID: cardID ?? this.cardID,
        amount: amount ?? this.amount);
  }
}

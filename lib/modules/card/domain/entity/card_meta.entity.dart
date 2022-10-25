class CardMetaEntity {
  final String userID;

  CardMetaEntity({
    required this.userID,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': userID,
    };
  }

  factory CardMetaEntity.fromMap(Map<String, dynamic> map) {
    return CardMetaEntity(
      userID: map['user_Id'] ?? '',
    );
  }

  @override
  String toString() {
    return 'GroupEntity(userID: $userID)';
  }

  @override
  int get hashCode {
    return userID.hashCode;
  }

  CardMetaEntity copyWith({
    String? userID,
  }) {
    return CardMetaEntity(
      userID: userID ?? this.userID,
    );
  }
}

class CreationCardEntity {
  final String userID;
  final String firstName;
  final String lastName;
  final String phone;

  CreationCardEntity({
    required this.userID,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userID,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
    };
  }

  factory CreationCardEntity.fromMap(Map<String, dynamic> map) {
    return CreationCardEntity(
      userID: map['userId'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  @override
  String toString() {
    return 'CreationCardEntity(id: $userID, firstName: $firstName, lastName: $lastName, phone: $phone)';
  }

  @override
  // ignore: hash_and_equals
  int get hashCode {
    return userID.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phone.hashCode;
  }

  CreationCardEntity copyWith({
    String? userID,
    String? firstName,
    String? lastName,
    String? phone,
  }) {
    return CreationCardEntity(
      userID: userID ?? this.userID,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
    );
  }
}

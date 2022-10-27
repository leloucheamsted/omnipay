class AppUser {
  final String id;
  final String firstName;
  final String lastName;
  final int amount;
  final String phone;

  AppUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.amount,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'amount': amount,
      'phone': phone,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      amount: map['amount'] ?? 0,
      phone: map['description'] ?? '',
    );
  }

  @override
  String toString() {
    return 'GroupEntity(id: $id, firstName: $firstName, lastName: $lastName, amount: $amount, phone: $phone)';
  }

  @override
  // ignore: hash_and_equals
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        amount.hashCode ^
        phone.hashCode;
  }

  AppUser copyWith({
    String? id,
    String? firstName,
    String? lastName,
    int? amount,
    String? phone,
  }) {
    return AppUser(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      amount: amount ?? this.amount,
      phone: phone ?? this.phone,
    );
  }
}

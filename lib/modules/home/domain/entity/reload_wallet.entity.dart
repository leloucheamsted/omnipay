class ReloadWalletEntity {
  final String dateInitiated;
  final String message;
  final String status;
  final String transId;

  ReloadWalletEntity({
    required this.dateInitiated,
    required this.message,
    required this.status,
    required this.transId,
  });

  Map<String, dynamic> toMap() {
    return {
      'dateInitiated': dateInitiated,
      'message': message,
      'status': status,
      'transId': transId,
    };
  }

  factory ReloadWalletEntity.fromMap(Map<String, dynamic> map) {
    return ReloadWalletEntity(
      dateInitiated: map['dateInitiated'] ?? '',
      message: map['message'] ?? '',
      status: map['status'] ?? '',
      transId: map['transId'] ?? '',
    );
  }

  @override
  String toString() {
    return 'ReloadWalletEntity(userID: $dateInitiated, amount: $message, phone: $status,email: $transId)';
  }

  @override
  // ignore: hash_and_equals
  int get hashCode {
    return dateInitiated.hashCode ^
        message.hashCode ^
        status.hashCode ^
        transId.hashCode;
  }

  ReloadWalletEntity copyWith(
      {String? dateInitiated,
      String? message,
      String? status,
      String? transId}) {
    return ReloadWalletEntity(
        dateInitiated: dateInitiated ?? this.dateInitiated,
        message: message ?? this.message,
        status: status ?? this.status,
        transId: transId ?? this.transId);
  }
}

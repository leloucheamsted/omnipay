class TransactionEntity {
  final int amount;
  final String dateConfirmed;
  final String dateInitiated;
  final String email;
  final String externalId;
  final String financialTransId;
  final String medium;
  final String redirectUrl;
  final String revenue;
  final String serviceName;
  final String status;
  final String statut;
  final String transId;
  final String userId;
  final String webhook;

  TransactionEntity(
      {required this.amount,
      required this.dateConfirmed,
      required this.dateInitiated,
      required this.email,
      required this.externalId,
      required this.financialTransId,
      required this.medium,
      required this.redirectUrl,
      required this.revenue,
      required this.serviceName,
      required this.status,
      required this.statut,
      required this.transId,
      required this.userId,
      required this.webhook});

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'dateConfirmed': dateConfirmed,
      'dateInitiated': dateInitiated,
      'email': email,
      'externalId': externalId,
      'financialTransId': financialTransId,
      'medium': medium,
      'redirectUrl': redirectUrl,
      'revenue': revenue,
      'serviceName': serviceName,
      'status': status,
      'statut': statut,
      'transId': transId,
      'userId': userId,
      'webhook': webhook
    };
  }

  factory TransactionEntity.fromMap(Map<String, dynamic> map) {
    return TransactionEntity(
      amount: map['amount'] ?? 0,
      dateConfirmed: map['dateConfirmed'] ?? '',
      dateInitiated: map['dateInitiated'] ?? '',
      email: map['email'] ?? '',
      externalId: map['externalId'] ?? '',
      financialTransId: map['financialTransId'] ?? '',
      medium: map['medium'] ?? '',
      redirectUrl: map['redirectUrl'] ?? '',
      revenue: map['revenue'] ?? '',
      serviceName: map['serviceName'] ?? '',
      status: map['status'] ?? '',
      statut: map['statut'] ?? '',
      transId: map['transId'] ?? '',
      userId: map['userId'] ?? '',
      webhook: map['webhook'] ?? '',
    );
  }

  @override
  String toString() {
    return 'TransactionEntity(amount: $amount,dateConfirmed: $dateConfirmed, dateInitiated: $dateInitiated, email: $email,externalId: $externalId,financialTransId: $financialTransId,medium: $medium, redirectUrl: $redirectUrl,revenue: $revenue,serviceName: $serviceName, status: $status, statut: $statut,transId: $transId, userId: $userId, webhook: $webhook)';
  }

  @override
  // ignore: hash_and_equals
  int get hashCode {
    return amount.hashCode ^
        dateConfirmed.hashCode ^
        dateInitiated.hashCode ^
        email.hashCode ^
        externalId.hashCode ^
        financialTransId.hashCode ^
        medium.hashCode ^
        redirectUrl.hashCode ^
        revenue.hashCode ^
        serviceName.hashCode ^
        status.hashCode ^
        statut.hashCode ^
        transId.hashCode ^
        userId.hashCode ^
        webhook.hashCode;
  }

  TransactionEntity copyWith({
    int? amount,
    String? dateConfirmed,
    String? dateInitiated,
    String? email,
    String? externalId,
    String? financialTransId,
    String? medium,
    String? redirectUrl,
    String? revenue,
    String? serviceName,
    String? status,
    String? statut,
    String? transId,
    String? userId,
    String? webhook,
  }) {
    return TransactionEntity(
      amount: amount ?? this.amount,
      dateConfirmed: dateConfirmed ?? this.dateConfirmed,
      dateInitiated: dateInitiated ?? this.dateInitiated,
      email: email ?? this.email,
      externalId: externalId ?? this.externalId,
      financialTransId: financialTransId ?? this.financialTransId,
      medium: medium ?? this.medium,
      redirectUrl: redirectUrl ?? this.redirectUrl,
      revenue: revenue ?? this.revenue,
      serviceName: serviceName ?? this.serviceName,
      status: status ?? this.status,
      statut: statut ?? this.statut,
      transId: transId ?? this.transId,
      userId: userId ?? this.userId,
      webhook: webhook ?? this.webhook,
    );
  }
}

import '../../../core/error/failure.dart';

enum TransactionsFailureType {
  serverError,
  recordError,
  reloadError,
}

class TransactionsFailure extends BaseFailure {
  final TransactionsFailureType type;
  // final String? msg;
  TransactionsFailure._(this.type, {required super.message});

  factory TransactionsFailure.serverError(String message) =>
      TransactionsFailure._(TransactionsFailureType.serverError,
          message: message);
  factory TransactionsFailure.recordError(String message) =>
      TransactionsFailure._(TransactionsFailureType.recordError,
          message: message);
  factory TransactionsFailure.reloadError(String message) =>
      TransactionsFailure._(TransactionsFailureType.reloadError,
          message: message);
}

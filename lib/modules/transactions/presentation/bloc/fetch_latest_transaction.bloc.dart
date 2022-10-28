import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:omnipay/modules/transactions/domain/entity/transaction.entity.dart';
import 'package:omnipay/modules/transactions/domain/usecases/latest_transaction_fetchlist.usecase.dart';

import '../../../core/presentation/action_state.dart';
import '../../../core/presentation/blocs/base_bloc.dart';
import '../../../core/presentation/either_stream_binder.dart';

class FetchLatestTransactionBloc extends BaseBloc {
  late FlutterSecureStorage secureStorage = FlutterSecureStorage();

  late final _streamBinder = EitherStreamBinder<List<TransactionEntity>>();
  late final LatestTransactionFetchListUseCase _useCase =
      LatestTransactionFetchListUseCase();
  Stream<ActionState<List<TransactionEntity>>> get outStream =>
      _streamBinder.outStream;

  late final StreamSubscription _eventSvcSub;

  FetchLatestTransactionBloc() {
    loadData();
  }
  List<TransactionEntity>? get loadedValue => _streamBinder.loadedValue;
  Future<void> loadData() async {
    String? userId = await secureStorage.read(key: 'idKey');
    return _streamBinder.callUseCase(() => _useCase.call(userId!),
        forceLoading: true);
  }

  void dipose() {
    _eventSvcSub.cancel();
    _streamBinder.dispose();
  }
}

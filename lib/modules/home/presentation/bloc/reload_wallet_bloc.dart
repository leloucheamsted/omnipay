import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:omnipay/modules/core/presentation/blocs/base_bloc.dart';
import 'package:omnipay/modules/home/domain/entity/reload_wallet.entity.dart';
import 'package:omnipay/modules/home/domain/usecases/confirm_reload.usecase.dart';
import 'package:omnipay/modules/home/domain/usecases/reload_wallet.usecase.dart';
import 'package:omnipay/modules/transactions/presentation/bloc/fetch_latest_transaction.bloc.dart';

import '../../../core/presentation/either_stream_binder.dart';
import '../../domain/entity/request_wallet.entity.dart';

class ReloadWalletBloc extends BaseBloc {
  late final ReloadWalletUseCase useCase = ReloadWalletUseCase();
  late final ConfirmReloadWalletUseCase confirmReloadWalletUseCase =
      ConfirmReloadWalletUseCase();
  // late final GetRrmote
  late final _useCaseStreamBind = EitherStreamBinder<ReloadWalletEntity>();

  ReloadWalletBloc();

  void action(RequestWalletEntity params) {
    _useCaseStreamBind.callUseCase(() => useCase.call(params),
        onCompleted: (_) => setBusy(false),
        onFailure: (error) => showAlert(error),
        onSuccess: (data) {
          if (kDebugMode) {
            print(data);
          }
          log("Operation=> Reload Request was send with success");
          Timer(const Duration(seconds: 15), () {
            _onActionVerify({"userId": params.userId, "data": data});
          });
        });
  }

  void _onActionVerify(dynamic data) async {
    log("Operation=> Validation Reload  Request");
    final FetchLatestTransactionBloc fetchLatestTransactionBloc =
        FetchLatestTransactionBloc();
    confirmReloadWalletUseCase.call(data.userId).then((response) {
      log("Confirmation Reload Response=> $response");
      fetchLatestTransactionBloc.loadData();
    });
    // await DialogService.simpleAlert(title: "Done", body: "Group created #$groupID");

    // Modular.to.navigate(AppRoute.groupDetail.withIdParam(groupID));
  }

  @override
  void dispose() {
    _useCaseStreamBind.dispose();
  }
}

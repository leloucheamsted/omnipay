import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:omnipay/modules/home/domain/entity/request_wallet.entity.dart';
import 'package:omnipay/modules/home/presentation/bloc/reload_wallet_bloc.dart';
import 'package:omnipay/modules/home/presentation/pages/ui/push_notification.dart';
import 'package:omnipay/modules/users/domain/usecases/session_read_user.usecase.dart';

import '../../../../routes/app_pages.dart';
import '../../../core/presentation/either_stream_binder.dart';
import '../../../users/domain/entity/app_user.dart';

enum TypeAction { reload, transfer }

enum Operator { mtn, orange }

class HomeBloc with ChangeNotifier {
  late final fetchUserDetailStreamBinder = EitherStreamBinder<AppUser?>();
  late final SessionReadUserUsecase _userGetDetailsUseCase =
      SessionReadUserUsecase();
  late final ReloadWalletBloc bloc = ReloadWalletBloc();
  late final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  // amount
  late bool _isValidAmountR;
  bool get isValidAmountR => _isValidAmountR;
  late int _amountR;
  int get amountR => _amountR;

  setValidAmountR(bool value) {
    _isValidAmountR = value;
    //notifyListeners();
  }

  // loading progress
  late bool _isLoading;
  bool get isLoading => _isLoading;

  setValidAmount(bool value) {
    _isValidAmountR = value;
    notifyListeners();
  }

  // type actions || reload or transfer
  late String _typeAction;
  String get typeAction => _typeAction;

  // _phoneNumber
  late String _phoneNumber;
  String get phoneNumber => _phoneNumber;
  late bool _isValidPhoneNumber;
  bool get isValidPhoneNumber => _isValidPhoneNumber;

  // operator mobile
  late String _operator;
  String get operator => _operator;

  // user
  AppUser _user = AppUser(
      id: 'id',
      firstName: 'firstName',
      lastName: 'lastName',
      amount: 0,
      phone: 'phone');
  AppUser get user => _user;
  AppUser? get currentUser => fetchUserDetailStreamBinder.loadedValue;
  HomeBloc() {
    _typeAction = TypeAction.reload.name;
    _isValidAmountR = true;
    getActualUser();
    _isLoading = false;
    _operator = Operator.mtn.name;
    _amountR = 0;
    _isValidPhoneNumber = true;
    _phoneNumber = "";
  }

  changeTypeAction(String action) {
    _typeAction = action;
    log("info: The user want to pass a $action operation ");
    notifyListeners();
  }

  changeOperator(String operator) {
    _operator = operator;
    log("info: The new operator is $operator");
    notifyListeners();
  }

  /// To get the user of application
  void getActualUser() async {
    fetchUserDetailStreamBinder.callUseCase(
      () => _userGetDetailsUseCase.call(null),
      forceLoading: true,
      onSuccess: (data) {
        log("CurrentUser=> $data");
        _user = data!;
        notifyListeners();
      },
    );
    // FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    // final userId = await secureStorage.read(key: 'idKey');
    // log("OnGetByUser=> $userId");
    // _user = await userUsecase.call(userId.toString());
    //notifyListeners();
  }

  Future<bool> verifyPhoneNumber(String phoneNumber) async {
    if (phoneNumber == "" || phoneNumber[0] != '6' || phoneNumber.length < 9) {
      _isValidPhoneNumber = false;
      log('error: invalid phone number $phoneNumber');
    } else {
      log('succes: valid phone number $phoneNumber');
      _isValidPhoneNumber = true;
    }
    if (_isValidPhoneNumber == true) {
      Get.back();
      if (_typeAction == TypeAction.reload.name) {
        log("Operation=> Reload amountvstart with $amountR XCFA");
        String? userid = await _secureStorage.read(key: 'idKey');
        RequestWalletEntity params = RequestWalletEntity(
            userId: userid!,
            phone: phoneNumber,
            amount: amountR.toString(),
            email: 'paymate@gmail.com');
        bloc.action(params);
        Get.toNamed(Routes.RECHARGELOADING);
      } else {
        Get.toNamed(Routes.TRANSFERLOADING);
      }
    }
    notifyListeners();
    return _isValidPhoneNumber;
  }

  bool verifyAmount(int amount) {
    if (amount >= 5000 && amount <= 50000) {
      _isValidAmountR = true;
      log("info: your have enter $amount FCFA");
    } else {
      _isValidAmountR = false;
      log("error: invalid amount, please make sure than you enter a valid amount");
    }
    notifyListeners();
    return _isValidAmountR;
  }

  changeStatus(context) {
    _isLoading = !_isLoading;
    // ignore: unused_local_variable
    Timer timer1;
    timer1 = Timer(const Duration(milliseconds: 2000), () {
      _isLoading = !_isLoading;
      Get.offAllNamed(Routes.HOME);
      ScaffoldMessenger.of(context).showSnackBar(pushReloadSucces);
    });
    notifyListeners();
  }
  // verfi
}

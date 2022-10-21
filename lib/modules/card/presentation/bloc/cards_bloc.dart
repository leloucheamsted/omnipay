// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omnipay/modules/card/presentation/pages/ui/push_notification.dart';

import '../../../../routes/app_pages.dart';

class CardsBloc with ChangeNotifier {
  // lock and unlock card details informations
  late bool _isBlock;
  bool get isBlock => _isBlock;

  // valid amount in inout amount card loading
  late bool _isValidAmountR;
  bool get isValidAmountR => _isValidAmountR;
  late int _amountR;
  int get amountR => _amountR;

  // card creation loading event
  late bool _loadingCard;
  bool get loadingCard => _loadingCard;

  CardsBloc() {
    _isBlock = false;
    _isValidAmountR = true;
    _loadingCard = false;
    _amountR = 0;
  }

  changeBlockStatut(context) {
    _isBlock = !_isBlock;

    notifyListeners();
    if (_isBlock == true) {
      ScaffoldMessenger.of(context).showSnackBar(pushUnlock);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(pushLock);
    }
  }

  changeLaodingStatut() {
    _loadingCard = !_loadingCard;
    notifyListeners();
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

  creationCard(context) {
    Timer timer1, timer2, timer3;
    changeLaodingStatut();
    timer1 = Timer(const Duration(milliseconds: 2000), () {
      ScaffoldMessenger.of(context).showSnackBar(pushCardErrorCreation);
    });
    timer2 = Timer(const Duration(milliseconds: 4000), () {
      ScaffoldMessenger.of(context).showSnackBar(pushCardSuccesCreation);

      Get.back();
    });
    timer3 = Timer(const Duration(milliseconds: 6000), () {
      Get.toNamed(Routes.CARDCONFIRM);
    });
    notifyListeners();
  }
}

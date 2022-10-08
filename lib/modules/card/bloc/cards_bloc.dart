import 'dart:developer';

import 'package:flutter/material.dart';

class CardsBloc with ChangeNotifier {
  late bool _isBlock;
  bool get isBlock => _isBlock;

  late bool _isValidAmountR;
  bool get isValidAmountR => _isValidAmountR;
  late int _amountR;
  int get amountR => _amountR;

  CardsBloc() {
    _isBlock = false;
    _isValidAmountR = true;
    _amountR = 0;
  }

  changeBlockStatut() {
    _isBlock = !_isBlock;
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
}

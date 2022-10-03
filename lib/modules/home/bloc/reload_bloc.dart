import 'dart:developer';

import 'package:flutter/cupertino.dart';

class HomeBloc with ChangeNotifier {
  // amount
  late bool _isValidAmountR;
  bool get isValidAmountR => _isValidAmountR;
  late int _amountR;
  int get amountR => _amountR;

  // _phoneNumber

  late String _phoneNumberR;
  String get phoneNumberR => _phoneNumberR;
  late bool _isValidPhoneNumberR;
  bool get isValidPhoneNumberR => _isValidPhoneNumberR;

  HomeBloc() {
    _isValidAmountR = true;
    _amountR = 0;
    _isValidPhoneNumberR = true;
    _phoneNumberR = "";
  }

  verifyAmount(int amount) {
    if (amount >= 5000 && amount <= 50000) {
      _isValidAmountR = true;
      log("info: your have enter $amount FCFA");
    } else {
      _isValidAmountR = false;
      log("error: invalid amount, please make sure than you enter a valid amount");
    }
    notifyListeners();
  }
}

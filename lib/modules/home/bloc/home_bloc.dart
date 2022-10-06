import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TypeAction { reload, transfer }

enum Operator { mtn, orange }

class HomeBloc with ChangeNotifier {
  // amount
  late bool _isValidAmountR;
  bool get isValidAmountR => _isValidAmountR;
  late int _amountR;
  int get amountR => _amountR;

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

  HomeBloc() {
    _typeAction = TypeAction.reload.name;
    _isValidAmountR = true;
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

  verifyPhoneNumber(String phoneNumber) {
    if (phoneNumber == "" || phoneNumber[0] != '6' || phoneNumber.length < 9) {
      _isValidPhoneNumber = false;
      log('error: invalid phone number $phoneNumber');
    } else {
      log('succes: valid phone number $phoneNumber');
      _isValidPhoneNumber = true;
    }
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
  // verfi
}

import 'dart:developer';

import 'package:flutter/material.dart';

class AuthBloc with ChangeNotifier {
  // phone number control
  late String _phoneNumberText;
  String get phoneNumberText => _phoneNumberText;

  // valid phone number bool
  late bool _isValidNumber;
  bool get isValidNumber => _isValidNumber;
  set setPhoneNumber(String value) {
    _phoneNumberText = value;
  }

  // otp code control
  late String _otpCode;
  String get otpCode => _otpCode;

  // valid otp code bool
  late bool _isValidOtp;
  bool get isValidOtp => _isValidOtp;
  set setOtpCode(String value) {
    _otpCode = value;
  }

  // name control
  late String _firstName;
  late String _lastName;
  String get firstName => _firstName;
  String get lastName => _lastName;
  set setFirstName(String firstnameValue) {
    _firstName = firstnameValue;
  }

  // valid name
  late bool _isValideFirstName;
  late bool _isValidLastName;
  bool get isValidFirstName => _isValideFirstName;
  bool get isValidLastName => _isValidLastName;

  set setLastName(String lastnameValue) {
    _lastName = lastnameValue;
  }

  AuthBloc() {
    _phoneNumberText = "";
    _isValideFirstName = true;
    _isValidLastName = true;
    _firstName = "";
    _lastName = "";
    _otpCode = "";
    _isValidNumber = true;
    _isValidOtp = true;
  }

  // function verification phone number
  phoneNumberVerification() {
    if (phoneNumberText == "" ||
        phoneNumberText[0] != '6' ||
        phoneNumberText.length < 9) {
      _isValidNumber = false;
      log('error: invalid phone number $phoneNumberText');
    } else {
      log('succes: valid phone number $phoneNumberText');
      _isValidNumber = true;
    }
    notifyListeners();
  }

  otpCodeVerification() {
    if (otpCode != "000000") {
      _isValidOtp = false;
      log("error: invalid code $otpCode");
    } else {
      log('success: valid otp code $otpCode');
      _isValidOtp = true;
    }
    notifyListeners();
  }

  namwVerification() {
    if (_firstName.isEmpty && _lastName.isEmpty) {
      _isValideFirstName = false;
      _isValidLastName = false;
      log("error: invalid input name form");
    } else if (_firstName.isEmpty && _lastName.isNotEmpty) {
      _isValideFirstName = false;
      _isValidLastName = true;
      log("error: invalid  first name value");
    } else if (_firstName.isNotEmpty && _lastName.isEmpty) {
      _isValideFirstName = true;
      _isValidLastName = false;
      log("error: invalid last name value ");
    } else {
      _isValidLastName = true;
      _isValideFirstName = true;
      log("success : valid input  form");
    }
    notifyListeners();
  }
}
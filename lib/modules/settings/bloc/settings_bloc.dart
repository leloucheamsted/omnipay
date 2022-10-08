import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SettingsBloc with ChangeNotifier {
  late bool _activeNotif;
  bool get actifNotif => _activeNotif;

//name
  late String _firstName;
  late String _lastName;
  String get firstName => _firstName;
  String get lastName => _lastName;
  set setFirstName(String firstnameValue) {
    _firstName = firstnameValue;
  }

  set setLastName(String lastnameValue) {
    _lastName = lastnameValue;
  }

  // valid name
  late bool _isValideFirstName;
  late bool _isValidLastName;
  bool get isValidFirstName => _isValideFirstName;
  bool get isValidLastName => _isValidLastName;

  SettingsBloc() {
    _firstName = "";
    _lastName = "";
    _isValideFirstName = true;
    _isValidLastName = true;
    _activeNotif = true;
  }
  changeStatutNotif() {
    _activeNotif = !_activeNotif;
    notifyListeners();
  }

  nameVerification() {
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
      updateName();
      log("success : valid input  form");
    }

    notifyListeners();
  }

  updateName() {
    Get.back();
    _firstName = "";
    _lastName = "";
  }
}

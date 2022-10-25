import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omnipay/modules/navigation/presentation/nav_bar.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:omnipay/modules/users/domain/entity/app_user.dart';
import 'package:omnipay/modules/users/domain/usecases/session_save_user.usecase.dart';

import '../../../../../routes/app_pages.dart';

class AuthBloc with ChangeNotifier {
  // validate loading
  late SessionSaveUserUsecase _saveUserUsecase;
  late bool _isLoading;

  bool get isLoading => _isLoading;
  // phone number control
  late String _phoneNumberText;
  String get phoneNumberText => _phoneNumberText;

  // verification ID
  late String _verificationID;
  String get verificationID => _verificationID;
  set setVerificationID(String value) {
    _verificationID = value;
  }

  // contrie code
  late String _contryCode;
  String get contryCode => _contryCode;
  set setContryCode(String value) {
    _contryCode = value;
  }

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
    _contryCode = "+237";
    _isLoading = false;
    _verificationID = "";
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
    // showLoadingAnimation();
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

  showLoadingAnimation() {
    _isLoading = !_isLoading;
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

      log("success : valid input  form");
      //goNotifpage();
    }
    notifyListeners();
  }

  goOtpPage() {
    showLoadingAnimation();
    Get.toNamed(Routes.OTP);
    showLoadingAnimation();
  }

  goUserCreatePage() {
    log("info: go to user insert name and subname page");
    Get.toNamed(Routes.USERCREATE);
  }

  goNotifpage() {
    showLoadingAnimation();
    Get.toNamed(Routes.NOTIF);
  }

  activateNotification() {
    Get.offAll(() => const NavBarPage());
  }

  otpCodeVerification() {
    if (otpCode != "000000") {
      _isValidOtp = false;
      log("error: invalid code $otpCode");
    } else {
      log('success: valid otp code $otpCode');
      _isValidOtp = true;
      goUserCreatePage();
    }
    notifyListeners();
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    _isLoading = true;
    notifyListeners();
    try {
      final authCredential =
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      _isLoading = false;
      notifyListeners();

      if (authCredential.user != null) {
        _isValidOtp = true;
        log("Reponse => credential: ${authCredential.user}");
        final user = FirebaseAuth.instance.currentUser;
        final String idToken = await user!.getIdToken(true);
        log("Reponse => token : $idToken");
        var params = {
          "phone": _phoneNumberText,
          "token": idToken,
          "id": user.uid,
        };
        if (kDebugMode) {
          print(params);
        }
        Get.toNamed(Routes.USERCREATE, parameters: params);
      }
    } on FirebaseAuthException catch (e) {
      _isValidOtp = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  // verification firebase number
  verifyPhoneNumber() async {
    _isLoading = true;
    notifyListeners();
    Get.toNamed(Routes.OTP);
    // await FirebaseAuth.instance.verifyPhoneNumber(
    //   phoneNumber: _contryCode + _phoneNumberText,
    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     _isLoading = true;
    //     notifyListeners();
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     _isLoading = false;
    //     log("erro:$e");
    //     notifyListeners();
    //   },
    //   codeSent: (String verificationId, int? resendToken) {
    //     _isLoading = false;
    //     notifyListeners();

    //     _verificationID = verificationId;
    //     log("info: phoeNumber : ${_contryCode + _phoneNumberText}");
    //     log("info: verificationID:$_verificationID");
    //     log("info: go to OTP page");
    //     Get.toNamed(Routes.OTP);
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {},
    // );
  }

  otpVerification() {
    // PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
    //     verificationId: _verificationID, smsCode: _otpCode);
    var params = {
      "phone": '682421795',
      "token": 'tokenKey',
      "id": '123485',
    };
    if (kDebugMode) {
      print(params);
    }
    Get.toNamed(Routes.USERCREATE, parameters: params);
    //signInWithPhoneAuthCredential(phoneAuthCredential);
  }
}

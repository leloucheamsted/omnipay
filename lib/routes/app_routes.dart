// ignore_for_file: constant_identifier_names, unused_field
part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const AUTH = _Paths.AUTH;
  static const OTP = _Paths.OTP;
  static const USERCREATE = _Paths.USERCREATE;
  static const NOTIF = _Paths.NOTIF;
  static const EDITPROFILE = _Paths.EDITPROFILE;
  static const NEWCARD = _Paths.NEWCARD;
  static const VIRTUALCARD = _Paths.VIRTUALCARD;
  static const TRANSFERLOADING = _Paths.TRANSFERLOADING;
  static const RECHARGELOADING = _Paths.RECHARGELOADING;
  static const CARDCONFIRM = _Paths.CARDCONFIRM;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const AUTH = '/auth';
  static const OTP = '/otp';
  static const USERCREATE = '/user/create';
  static const NOTIF = '/notif';
  static const EDITPROFILE = '/edit/profile';
  static const NEWCARD = '/new/card';
  static const VIRTUALCARD = '/virtual/card';
  static const TRANSFERLOADING = '/transfer/loading';
  static const RECHARGELOADING = '/recharge/loading';
  static const CARDCONFIRM = '/card/confirm';
}

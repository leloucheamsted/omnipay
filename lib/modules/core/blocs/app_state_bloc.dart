import 'package:flutter/cupertino.dart';
import '../../users/domain/entity/app_user.dart';

class AppStateBloc with ChangeNotifier {
  // App user
  late AppUser _appUser;
  AppUser get appUser => _appUser;
  set setAppUser(AppUser appUser) {
    _appUser = appUser;
  }

  AppStateBloc() {
    _appUser =
        AppUser(id: 'id', firstName: '', lastName: '', amount: 0, phone: '');
  }
}

import 'package:flutter/cupertino.dart';

class SettingsBloc with ChangeNotifier {
  late bool _activeNotif;
  bool get actifNotif => _activeNotif;

  SettingsBloc() {
    _activeNotif = true;
  }
  changeStatutNotif() {
    _activeNotif = !_activeNotif;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class CardsBloc with ChangeNotifier {
  late bool _isBlock;
  bool get isBlock => _isBlock;

  CardsBloc() {
    _isBlock = false;
  }

  changeBlockStatut() {
    _isBlock = !_isBlock;
    notifyListeners();
  }
}

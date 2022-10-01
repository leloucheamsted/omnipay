// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'dart:developer';

enum TabList { Home, MyCards, Transactions, Settings }

class NavBarProvider with ChangeNotifier {
  late int _currentTab = 0;
  int get currentTab => _currentTab;

  NavBarProvider() {
    _currentTab = 0;
    print(currentTab);
  }

  changeTab(int tabIndex) {
    _currentTab = tabIndex;
    log('Current Tab page is  ${TabList.values[tabIndex].name}');
    notifyListeners();
    //return ;
  }
}

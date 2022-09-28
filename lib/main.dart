import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omnipay/modules/common/constants/palette_color.dart';
import 'package:omnipay/modules/common/constants/theme_constants.dart';
import 'package:omnipay/modules/users/presentation/auth/pages/phone_input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // status bar color
        systemNavigationBarDividerColor: PaletteColor.white,
        systemNavigationBarColor: PaletteColor.white));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConstants.theme,
      home: const PhoneInputPage(),
    );
  }
}

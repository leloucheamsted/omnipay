import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omnipay/modules/common/constants/constants.dart';

class ThemeConstants {
  static final theme = ThemeData(
    backgroundColor: PaletteColor.greyLight,
    primaryColor: PaletteColor.primary,
    fontFamily: 'Georgia',
    scaffoldBackgroundColor: PaletteColor.greyLight,
    appBarTheme: AppBarTheme(
      elevation: 0,
      toolbarTextStyle: const TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
        ),
      ).bodyText2,
      titleTextStyle: const TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
        ),
      ).headline6,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: PaletteColor.dark,
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: PaletteColor.secondary),
  );
}

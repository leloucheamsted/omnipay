import 'package:flutter/material.dart';
import 'package:omnipay/modules/common/constants/palette_color.dart';

class LayoutConstants {
  const LayoutConstants._();

  //Padding
  static const double paddingZero = 0.0;
  static const double paddingS = 10.0;
  static const double paddingM = 16.0;

  // Spacing
  static const double spaceS = 5.0;
  static const double spaceM = 10.0;
  static const double spaceL = 20.0;
  static const double spaceXL = 40;

  // Radius
  static const double radiusS = 10.0;
  static const double radiusM = 20.0;

  // Border
  static final border = Border.all(
    width: 1,
    color: PaletteColor.grey,
  ); //size object
  static const double appBarSize = 45;
  static const double btnHeight = 50;
}

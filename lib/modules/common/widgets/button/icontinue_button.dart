import 'package:flutter/material.dart';
import 'package:omnipay/modules/common/constants/palette_color.dart';
import 'package:omnipay/modules/common/widgets/button/abstract_button.dart';

class IContinueButton extends AbstractButtn {
  const IContinueButton({
    super.key,
    required super.widget,
  }) : super(
          background: PaletteColor.primary,
        );
}

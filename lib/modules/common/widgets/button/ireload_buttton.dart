import 'package:flutter/material.dart';
import 'package:omnipay/modules/common/constants/palette_color.dart';
import 'package:omnipay/modules/common/widgets/button/abstract_button.dart';

class IReloadButton extends AbstractButtn {
  const IReloadButton({
    required super.width,
    required super.widget,
  }) : super(
          background: PaletteColor.greyLight,
        );
}

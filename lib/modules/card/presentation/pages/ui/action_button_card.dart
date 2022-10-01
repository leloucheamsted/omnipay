import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widgets/button/icon_custom_button.dart';

class ActionButtonCard extends StatelessWidget {
  const ActionButtonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconCustomButton(
            width: (MediaQuery.of(context).size.width - 52) / 2,
            content: 'Reload',
            icon: IconsConstants.plusIcon,
            background: PaletteColor.primaryLight.withOpacity(0.1),
            textColor: PaletteColor.primary),
        IconCustomButton(
            width: (MediaQuery.of(context).size.width - 32) / 2,
            content: 'Block',
            icon: IconsConstants.eyeIcon,
            background: PaletteColor.primaryLight.withOpacity(0.1),
            textColor: PaletteColor.primary),
      ],
    );
  }
}

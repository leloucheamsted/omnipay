import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omnipay/modules/common/constants/layout_constants.dart';
import 'package:omnipay/modules/common/widgets/typography/typo.widget.dart';

import '../../common/constants/constants.dart';

class AlertBottomPopup extends StatelessWidget {
  final String content;
  final StatutPopup statut;
  const AlertBottomPopup(
      {super.key, required this.content, required this.statut});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: LayoutConstants.btnHeight,
      decoration: BoxDecoration(
          color: statut == StatutPopup.danger
              ? PaletteColor.danger
              : PaletteColor.primary,
          borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: statut == StatutPopup.danger
                    ? PaletteColor.danger.withOpacity(0.4)
                    : PaletteColor.primary.withOpacity(0.4),
                blurRadius: 30.0,
                offset: const Offset(0.0, 0.75))
          ]),
      child: Row(children: [
        const SizedBox(
          width: LayoutConstants.spaceM,
        ),
        SvgPicture.asset(IconsConstants.infoIcon),
        const SizedBox(
          width: LayoutConstants.spaceM / 2,
        ),
        SubTitle1(content: content, color: PaletteColor.white),
      ]),
    );
  }
}

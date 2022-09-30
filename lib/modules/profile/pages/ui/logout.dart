import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../../card/pages/ui/circle_icon.dart';
import '../../../common/constants/constants.dart';
import '../../../common/widget.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: PaletteColor.danger,
          borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.white12,
                blurRadius: 30.0,
                offset: Offset(0.0, 0.75))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(
          LayoutConstants.paddingS,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  IconsConstants.logoutIcon,
                  height: 50,
                  width: 50,
                  color: PaletteColor.white,
                ),
                const SizedBox(
                  width: LayoutConstants.spaceM,
                ),
                const BodyText1(content: 'Logout', color: PaletteColor.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

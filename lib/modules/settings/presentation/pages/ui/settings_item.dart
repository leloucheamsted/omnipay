import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omnipay/modules/card/presentation/pages/ui/circle_icon.dart';
import 'package:omnipay/modules/common/widget.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../common/constants/constants.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: PaletteColor.white,
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
                CircleIcon(
                    size: 50,
                    color: PaletteColor.primaryLight.withOpacity(0.1),
                    child: SvgPicture.asset(
                      IconsConstants.userIcon,
                      color: PaletteColor.primary,
                    )),
                const SizedBox(
                  width: LayoutConstants.spaceM,
                ),
                const BodyText1(
                    content: 'My Profile', color: PaletteColor.dark),
              ],
            ),
            FlutterSwitch(
              height: 35,
              width: 60,
              toggleSize: 20.0,
              inactiveColor: PaletteColor.greyLight,
              activeColor: PaletteColor.primaryLight.withOpacity(0.1),
              toggleColor: PaletteColor.primary,
              value: true,
              borderRadius: 30.0,
              padding: 5.0,
              showOnOff: false,
              onToggle: (val) {
                // setState(() {
                //   status = val;
                // });
              },
            ),
          ],
        ),
      ),
    );
  }
}

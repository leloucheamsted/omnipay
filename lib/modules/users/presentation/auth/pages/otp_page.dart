import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omnipay/modules/common/constants/font_family_constants.dart';
import 'package:omnipay/modules/common/constants/font_size_contants.dart';
import 'package:omnipay/modules/common/constants/icons_constants.dart';
import 'package:omnipay/modules/common/constants/palette_color.dart';
import 'package:omnipay/modules/common/widgets/typography/typo.widget.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            height: 60,
            decoration: BoxDecoration(
              color: PaletteColor.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _navigationItem(IconsConstants.homeIcon, 'Home'),
                  _navigationItem(IconsConstants.creditcardIcon, 'My cards'),
                  _navigationItem(IconsConstants.activityIcon, 'Transactions'),
                  _navigationItem(IconsConstants.settingsIcon, 'Settings'),
                ],
              ),
            )));
  }

  Widget _navigationItem(String icon, name) {
    return Column(
      children: [
        SvgPicture.asset(
          height: 22,
          width: 22,
          icon,
          color: PaletteColor.primary,
        ),
        Text(
          name,
          style: TextStyle(
              fontFamily: FontsFamilyConstants.fontMedium,
              color: PaletteColor.primary,
              fontSize: FontsSizeConstants.bodytext1),
        )
      ],
    );
  }
}

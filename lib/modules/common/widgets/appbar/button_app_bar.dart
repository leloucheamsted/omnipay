import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnipay/modules/common/constants/icons_constants.dart';

import '../../constants/layout_constants.dart';
import '../../constants/palette_color.dart';

class ButtonAppBar extends StatelessWidget {
  final VoidCallback backEvent;
  const ButtonAppBar({super.key, required this.backEvent});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: LayoutConstants.appBarSize * 1.4,
      color: PaletteColor.greyLight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingS,
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero),
        child: InkWell(
          onTap: backEvent,
          child: SizedBox(
            height: 25,
            width: 25,
            child: SvgPicture.asset(IconsConstants.arrowleftIcon),
          ),
        ),
      ),
    );
  }
}

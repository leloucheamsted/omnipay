import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/constants/constants.dart';

final pushReloadSucces = SnackBar(
  duration: const Duration(seconds: 4),
  content: Padding(
    padding: const EdgeInsets.all(LayoutConstants.paddingM),
    child: Container(
      color: PaletteColor.success,
      child: Row(children: [
        SvgPicture.asset(
          IconsConstants.notificationIcon,
          color: PaletteColor.white,
        ),
        const SizedBox(
          width: LayoutConstants.spaceM,
        ),
        Text(
          'Your main balance has been successfully reloaded.',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: PaletteColor.white,
            fontFamily: FontsFamilyConstants.fontRegular,
            fontWeight: FontWeight.w400,
            fontSize: FontsSizeConstants.title3,
          ),
        ),
      ]),
    ),
  ),
);
final pushReloadFailed = SnackBar(
  duration: const Duration(seconds: 4),
  content: Padding(
    padding: const EdgeInsets.all(LayoutConstants.paddingM),
    child: Container(
      color: PaletteColor.danger,
      child: Row(children: [
        SvgPicture.asset(
          IconsConstants.notificationIcon,
          color: PaletteColor.white,
        ),
        const SizedBox(
          width: LayoutConstants.spaceM,
        ),
        Text(
          'There was an error while reloading your main balance.',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: PaletteColor.white,
            fontFamily: FontsFamilyConstants.fontRegular,
            fontWeight: FontWeight.w400,
            fontSize: FontsSizeConstants.title3,
          ),
        ),
      ]),
    ),
  ),
);

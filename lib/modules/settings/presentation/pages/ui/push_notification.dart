import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/constants/constants.dart';

final pushNotifDisabled = SnackBar(
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
          'Notifications disabled',
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
final pushNotifEnabled = SnackBar(
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
          'Notifications enabled',
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
final pushSuccessprofile = SnackBar(
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
          'Profile information has been updated.',
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

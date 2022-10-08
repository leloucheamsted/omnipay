import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/constants/constants.dart';

final pushReloading = SnackBar(
  duration: const Duration(seconds: 4),
  content: Padding(
    padding: const EdgeInsets.all(LayoutConstants.paddingM),
    child: Container(
      color: PaletteColor.primary,
      child: Row(children: [
        SvgPicture.asset(
          IconsConstants.notificationIcon,
          color: PaletteColor.white,
        ),
        const SizedBox(
          width: LayoutConstants.spaceM,
        ),
        Text(
          'We are reloading your card. You will be notified once it has been completed.',
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
final pushUnlock = SnackBar(
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
          'Your card has been locked.',
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
final pushLock = SnackBar(
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
          'Your card has been unblocked.',
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

final pushCardErrorCreation = SnackBar(
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
          'Please reload your main balance to create a card.',
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
final pushCardSuccesCreation = SnackBar(
  duration: const Duration(seconds: 4),
  content: Padding(
    padding: const EdgeInsets.all(LayoutConstants.paddingM),
    child: Container(
      color: PaletteColor.primary,
      child: Row(children: [
        SvgPicture.asset(
          IconsConstants.notificationIcon,
          color: PaletteColor.white,
        ),
        const SizedBox(
          width: LayoutConstants.spaceM,
        ),
        Text(
          'You will be notified when physical cards become available.',
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

final pushCardAreadlyCreate = SnackBar(
  duration: const Duration(seconds: 4),
  content: Padding(
    padding: const EdgeInsets.all(LayoutConstants.paddingM),
    child: Container(
      color: PaletteColor.primary,
      child: Row(children: [
        SvgPicture.asset(
          IconsConstants.notificationIcon,
          color: PaletteColor.white,
        ),
        const SizedBox(
          width: LayoutConstants.spaceM,
        ),
        Text(
          'You\'ve already created a virtual card.',
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

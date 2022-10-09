import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/constants/constants.dart';

final pushReloading = SnackBar(
  backgroundColor: PaletteColor.primary,
  duration: const Duration(seconds: 5),
  behavior: SnackBarBehavior.floating,
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(LayoutConstants.radiusS))),
  elevation: 15,
  content: SizedBox(
    child: Row(children: [
      SvgPicture.asset(
        IconsConstants.infoIcon,
        color: PaletteColor.white,
      ),
      const SizedBox(
        width: LayoutConstants.spaceM,
      ),
      Flexible(
        child: Text(
          'We are reloading your card. You will be notified once it has been completed.',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: PaletteColor.white,
            fontFamily: FontsFamilyConstants.fontRegular,
            fontWeight: FontWeight.w400,
            fontSize: FontsSizeConstants.subtitle1,
          ),
        ),
      ),
    ]),
  ),
);
final pushUnlock = SnackBar(
  backgroundColor: PaletteColor.success,
  duration: const Duration(seconds: 2),
  behavior: SnackBarBehavior.floating,
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(LayoutConstants.radiusS))),
  elevation: 15,
  content: SizedBox(
    child: Row(children: [
      SvgPicture.asset(
        IconsConstants.infoIcon,
        color: PaletteColor.white,
      ),
      const SizedBox(
        width: LayoutConstants.spaceM,
      ),
      Flexible(
        child: Text(
          'Your card has been locked.',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: PaletteColor.white,
            fontFamily: FontsFamilyConstants.fontRegular,
            fontWeight: FontWeight.w400,
            fontSize: FontsSizeConstants.subtitle1,
          ),
        ),
      ),
    ]),
  ),
);
final pushLock = SnackBar(
  backgroundColor: PaletteColor.success,
  duration: const Duration(seconds: 2),
  behavior: SnackBarBehavior.floating,
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(LayoutConstants.radiusS))),
  content: SizedBox(
    child: Row(children: [
      SvgPicture.asset(
        IconsConstants.infoIcon,
        color: PaletteColor.white,
      ),
      const SizedBox(
        width: LayoutConstants.spaceM,
      ),
      Flexible(
        child: Text(
          'Your card has been unblocked.',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: PaletteColor.white,
            fontFamily: FontsFamilyConstants.fontRegular,
            fontWeight: FontWeight.w400,
            fontSize: FontsSizeConstants.subtitle1,
          ),
        ),
      ),
    ]),
  ),
);

final pushCardErrorCreation = SnackBar(
  backgroundColor: PaletteColor.danger,
  duration: const Duration(seconds: 5),
  behavior: SnackBarBehavior.floating,
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(LayoutConstants.radiusS))),
  content: SizedBox(
    child: Row(children: [
      SvgPicture.asset(
        IconsConstants.infoIcon,
        color: PaletteColor.white,
      ),
      const SizedBox(
        width: LayoutConstants.spaceM,
      ),
      Flexible(
        child: Text(
          'Please reload your main balance to create a card.',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: PaletteColor.white,
            fontFamily: FontsFamilyConstants.fontRegular,
            fontWeight: FontWeight.w400,
            fontSize: FontsSizeConstants.subtitle1,
          ),
        ),
      ),
    ]),
  ),
);
final pushCardSuccesCreation = SnackBar(
  backgroundColor: PaletteColor.primary,
  duration: const Duration(seconds: 5),
  behavior: SnackBarBehavior.floating,
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(LayoutConstants.radiusS))),
  content: SizedBox(
    child: Row(children: [
      SvgPicture.asset(
        IconsConstants.infoIcon,
        color: PaletteColor.white,
      ),
      const SizedBox(
        width: LayoutConstants.spaceM,
      ),
      Flexible(
        child: Text(
          'You will be notified when physical cards become available.',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: PaletteColor.white,
            fontFamily: FontsFamilyConstants.fontRegular,
            fontWeight: FontWeight.w400,
            fontSize: FontsSizeConstants.subtitle1,
          ),
        ),
      ),
    ]),
  ),
);

final pushCardAreadlyCreate = SnackBar(
  backgroundColor: PaletteColor.primary,
  duration: const Duration(seconds: 5),
  behavior: SnackBarBehavior.floating,
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(LayoutConstants.radiusS))),
  content: Padding(
    padding: const EdgeInsets.all(LayoutConstants.paddingM),
    child: SizedBox(
      child: Row(children: [
        SvgPicture.asset(
          IconsConstants.infoIcon,
          color: PaletteColor.white,
        ),
        const SizedBox(
          width: LayoutConstants.spaceM,
        ),
        Flexible(
          child: Text(
            'You\'ve already created a virtual card.',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: PaletteColor.white,
              fontFamily: FontsFamilyConstants.fontRegular,
              fontWeight: FontWeight.w400,
              fontSize: FontsSizeConstants.title3,
            ),
          ),
        ),
      ]),
    ),
  ),
);

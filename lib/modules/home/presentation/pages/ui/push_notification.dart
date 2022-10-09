import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/constants/constants.dart';

final pushReloadSucces = SnackBar(
  backgroundColor: PaletteColor.success,
  duration: const Duration(seconds: 3),
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
          'Your main balance has been successfully reloaded.',
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
final pushReloadFailed = SnackBar(
  backgroundColor: PaletteColor.danger,
  duration: const Duration(seconds: 3),
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
          'There was an error while reloading your main balance.',
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

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/constants.dart';
import '../../widget.dart';

class BackButtonWithTitleAppBar extends StatelessWidget {
  final VoidCallback backEvent;
  final String title;
  const BackButtonWithTitleAppBar(
      {super.key, required this.backEvent, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: LayoutConstants.appBarSize * 2.5,
      color: PaletteColor.greyLight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingM,
            LayoutConstants.paddingM,
            LayoutConstants.paddingM),
        child: Row(
          children: [
            InkWell(
              onTap: backEvent,
              child: Container(
                height: 30,
                width: 30,
                child: SvgPicture.asset(IconsConstants.arrowleftIcon),
              ),
            ),
            const SizedBox(
              width: LayoutConstants.spaceM,
            ),
            Title2(content: title, color: PaletteColor.dark),
          ],
        ),
      ),
    );
  }
}

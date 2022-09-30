import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';
import '../../widget.dart';

class IconCustomButton extends StatelessWidget {
  final double width;
  final String content, icon;
  final Color background, textColor;
  const IconCustomButton(
      {super.key,
      required this.width,
      required this.content,
      required this.icon,
      required this.background,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: LayoutConstants.btnHeight,
      width: width,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.white12,
                blurRadius: 30.0,
                offset: Offset(0.0, 0.75))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(LayoutConstants.paddingS),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              color: textColor,
            ),
            const SizedBox(
              width: LayoutConstants.spaceS,
            ),
            BodyText1(content: content, color: textColor)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';
import '../../widget.dart';

class WidthButton extends StatelessWidget {
  final double width;
  final String content;
  final VoidCallback event;
  final Color background, textColor;
  const WidthButton(
      {super.key,
      required this.width,
      required this.content,
      required this.background,
      required this.textColor,
      required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: event,
      child: Container(
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
            child: BodyText1(content: content, color: textColor)),
      ),
    );
  }
}

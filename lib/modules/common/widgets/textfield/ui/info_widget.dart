import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/constants.dart';
import '../../typography/typo.widget.dart';

class ErrorMessage extends StatelessWidget {
  final Color color;
  final String errorMessage;
  const ErrorMessage(
      {super.key, required this.errorMessage, required this.color});

  @override
  Widget build(BuildContext context) {
    return ErrorText(content: errorMessage, color: color);
  }
}

class InfoMessage extends StatelessWidget {
  final String message;
  final String? icon;
  final Color color;
  const InfoMessage(
      {super.key, required this.message, this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: icon != null
              ? SvgPicture.asset(
                  icon!,
                  color: color,
                )
              : null,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          message,
          style: TextStyle(
            color: color,
            fontFamily: FontsFamilyConstants.fontRegular,
            fontWeight: FontWeight.w500,
            fontSize: FontsSizeConstants.bodytext1,
          ),
        )
      ],
    );
  }
}

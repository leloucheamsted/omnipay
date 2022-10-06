import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/constants/constants.dart';

class CircleIcon extends StatelessWidget {
  final double size;
  final Color color;
  final SvgPicture child;
  const CircleIcon(
      {super.key,
      required this.size,
      required this.color,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(LayoutConstants.radiusM * 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(LayoutConstants.paddingM),
        child: child,
      ),
    );
  }
}

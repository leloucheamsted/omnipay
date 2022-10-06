import 'package:flutter/material.dart';

class ContainerShadow extends StatelessWidget {
  final double radius;
  final double? height, width;
  final Alignment align;
  final EdgeInsets padding;
  final Widget widget;
  final Color color;
  const ContainerShadow(
      {super.key,
      required this.radius,
      this.height,
      this.width,
      required this.align,
      required this.padding,
      required this.widget,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: align,
      height: height ?? height,
      width: width ?? width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Material(
        elevation: 1,
        child: Container(
          padding: padding,
          alignment: align,
          height: height ?? height,
          width: width ?? width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: widget,
        ),
      ),
    );
  }
}

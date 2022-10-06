import 'package:flutter/material.dart';
import 'package:omnipay/modules/common/constants/layout_constants.dart';

class ReloadButton extends StatelessWidget {
  final Color background;
  final Widget widget;
  final double? width;
  const ReloadButton(
      {super.key, required this.background, required this.widget, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: LayoutConstants.btnHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
      ),
      child: Padding(
        padding: const EdgeInsets.all(LayoutConstants.paddingS),
        child: widget,
      ),
    );
  }
}

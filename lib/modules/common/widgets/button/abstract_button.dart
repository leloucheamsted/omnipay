import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/constants/layout_constants.dart';

class AbstractButtn extends StatelessWidget {
  final Color background;
  final Widget widget;
  const AbstractButtn(
      {super.key, required this.background, required this.widget});

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

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/constants/layout_constants.dart';
import 'package:omnipay/modules/common/constants/palette_color.dart';
import 'package:omnipay/modules/common/widget.dart';

class ChoiceAmount extends StatelessWidget {
  final double width;
  final String amount;
  const ChoiceAmount({super.key, required this.width, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _amountWidget(),
        _amountWidget(),
        _amountWidget(),
      ],
    );
  }

  Widget _amountWidget() {
    return Container(
      alignment: Alignment.center,
      height: LayoutConstants.btnHeight,
      width: width,
      decoration: BoxDecoration(
          color: PaletteColor.white, // ORIGINAL COLOR IS GRAYLIGHT
          borderRadius: BorderRadius.circular(LayoutConstants.radiusS)),
      child: BodyText1(content: '124', color: PaletteColor.dark),
    );
  }
}

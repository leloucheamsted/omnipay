import 'dart:developer';

import 'package:flutter/material.dart';
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
        _amountWidget('5,000'),
        _amountWidget('10,000'),
        _amountWidget('15,000'),
      ],
    );
  }

  Widget _amountWidget(String amount) {
    return GestureDetector(
      onTap: () {
        log("info: $amount refill has been selected");
        // final output = amount.replaceAll(RegExp(","), '');
      },
      child: Container(
        alignment: Alignment.center,
        height: LayoutConstants.btnHeight,
        width: width,
        decoration: BoxDecoration(
            color: PaletteColor.greyLight, // ORIGINAL COLOR IS GRAYLIGHT
            borderRadius: BorderRadius.circular(LayoutConstants.radiusS)),
        child: BodyText2(content: 'FCFA $amount', color: PaletteColor.dark),
      ),
    );
  }
}

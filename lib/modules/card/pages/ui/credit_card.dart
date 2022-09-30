import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnipay/modules/common/widget.dart';

import '../../../common/constants/constants.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: PaletteColor.primary,
            borderRadius: BorderRadius.circular(LayoutConstants.radiusM),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: PaletteColor.primary.withOpacity(0.4),
                  blurRadius: 30.0,
                  offset: const Offset(0.0, 0.75))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(
            LayoutConstants.paddingM,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _amountWidget(),
              const SizedBox(
                height: 40,
              ),
              _infoWidget(),
              const SizedBox(
                height: 40,
              ),
              _footerWidget(),
            ],
          ),
        ));
  }

  Widget _amountWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // amount
        Row(
          children: const [
            SubTitle4(content: 'FCFA', color: PaletteColor.white),
            SizedBox(
              width: LayoutConstants.spaceS,
            ),
            SubTitle4(content: '20,000', color: PaletteColor.white)
          ],
        ),
        SvgPicture.asset(IconsConstants.omnipay),
      ],
    );
  }

  Widget _infoWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SubTitle4(content: '1234  5678  9012  3456', color: PaletteColor.white),
        SizedBox(
          height: LayoutConstants.spaceS,
        ),
        SubTitle1(content: 'EXP  01/22', color: PaletteColor.white)
      ],
    );
  }

  Widget _footerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //  name
        const SubTitle4(content: 'Jeremy Smith', color: PaletteColor.white),
        SvgPicture.asset(IconsConstants.cardIcon),
      ],
    );
  }
}

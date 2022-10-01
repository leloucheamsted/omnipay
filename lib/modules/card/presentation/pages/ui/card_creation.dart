import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omnipay/modules/card/presentation/pages/ui/circle_icon.dart';
import 'package:omnipay/modules/common/widget.dart';

import '../../../../common/constants/constants.dart';

class CardCreation extends StatelessWidget {
  const CardCreation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _cardLayout(
            IconsConstants.cloudIcon,
            'FCFA 10,000',
            'Virtall debit Card',
            'A digital card for your digital life. You can use your omnipay card to make online purchases wherever MasterCard are accepted.'),
        const SizedBox(
          height: LayoutConstants.spaceM,
        ),
        _cardLayout(
            IconsConstants.creditcardIcon,
            'Comming soon',
            'Physicall debit Card',
            'A debit card that allows you to pay online whenever and wherever you want, pay in stores and withdraw money from ATMs.'),
      ],
    );
  }

  Widget _cardLayout(String icon, pricing, title, detaisl) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
          color: PaletteColor.white,
          borderRadius: BorderRadius.circular(LayoutConstants.radiusM),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.white10,
                blurRadius: 30.0,
                offset: Offset(0.0, 0.75))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: LayoutConstants.paddingM,
            vertical: LayoutConstants.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleIcon(
                  color: PaletteColor.primary,
                  size: LayoutConstants.circleIconSize,
                  child: SvgPicture.asset(
                    icon,
                    height: 25,
                    width: 25,
                  ),
                ),
                _rightView(pricing),
              ],
            ),
            const SizedBox(
              height: LayoutConstants.spaceM,
            ),
            BodyText1(content: title, color: PaletteColor.dark),
            const SizedBox(
              height: 3,
            ),
            _contentCard(detaisl)
          ],
        ),
      ),
    );
  }

  Widget _rightView(String pricing) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        color: PaletteColor.greyLight,
        borderRadius: BorderRadius.circular(LayoutConstants.radiusM),
      ),
      child: BodyText2(content: pricing, color: PaletteColor.dark),
    );
  }

  Widget _contentCard(String details) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
      child: Text(
        details,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            height: 1.4,
            fontWeight: FontWeight.w500,
            fontSize: 15,
            fontFamily: FontsFamilyConstants.fontRegular,
            color: PaletteColor.greyDark),
      ),
    );
  }
}

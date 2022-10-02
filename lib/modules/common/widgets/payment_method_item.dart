import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widgets/typography/typo.widget.dart';

class PaymentMethodItem extends StatelessWidget {
  final String? icon;
  final String transactionType;
  final String dateTime;
  final String amount;
  final Color avatarColor;
  const PaymentMethodItem(
      {super.key,
      required this.icon,
      required this.transactionType,
      required this.dateTime,
      required this.amount,
      required this.avatarColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: LayoutConstants.spaceS),
      child: Container(
          height: LayoutConstants.itemlistHeight,
          decoration: BoxDecoration(
              color: PaletteColor.white,
              borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Colors.white12,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(LayoutConstants.paddingS),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      ImagesConstants.mastercardImage,
                      height: 45,
                      width: 45,
                    ),
                    const SizedBox(
                      width: LayoutConstants.spaceM,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BodyText1(
                            content: transactionType, color: PaletteColor.dark),
                        const SizedBox(
                          height: 3,
                        ),
                        BodyText2(content: dateTime, color: PaletteColor.grey),
                      ],
                    )

                    // SvgPicture.asset(ImagesConstants.orangeImage),
                  ],
                ),
                Row(
                  children: [
                    const BodyText2(
                        content: '+FCFA ', color: PaletteColor.dark),
                    BodyText2(content: amount, color: PaletteColor.dark),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

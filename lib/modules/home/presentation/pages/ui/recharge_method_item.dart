import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widgets/typography/typo.widget.dart';

class RechargeMethodItem extends StatelessWidget {
  final String? icon;
  final String paymentType;
  final String info;
  const RechargeMethodItem({
    super.key,
    required this.icon,
    required this.paymentType,
    required this.info,
  });

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
                      icon!,
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(
                      width: LayoutConstants.spaceM,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BodyText1(
                            content: paymentType, color: PaletteColor.dark),
                        const SizedBox(
                          height: 3,
                        ),
                        BodyText2(content: info, color: PaletteColor.grey),
                      ],
                    )

                    // SvgPicture.asset(ImagesConstants.orangeImage),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

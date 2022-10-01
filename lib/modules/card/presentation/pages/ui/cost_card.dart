import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnipay/modules/card/presentation/pages/ui/circle_icon.dart';
import 'package:omnipay/modules/common/widget.dart';

import '../../../../common/constants/constants.dart';

class CostCardWidget extends StatelessWidget {
  const CostCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
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
            padding: const EdgeInsets.all(
              LayoutConstants.paddingM,
            ),
            child: Column(
              children: [
                const SubTitle1(
                    content: 'Cost of the card', color: PaletteColor.greyDark),
                const SizedBox(height: LayoutConstants.spaceS),
                const Title3(content: 'FCFA 10,000', color: PaletteColor.dark),
                const SizedBox(height: LayoutConstants.spaceL),
                const Divider(
                  thickness: 1,
                  color: PaletteColor.grey,
                ),
                Column(
                  children: [
                    _cardOption('Reload available 24/7',
                        'Reload your card easily and instantly with your mobile money account.'),
                    const SizedBox(
                      height: LayoutConstants.spaceL,
                    ),
                    _cardOption('PCI DSS certified',
                        'Data protection is provided by our partner in accordance with the international payment standard.'),
                    const SizedBox(
                      height: LayoutConstants.spaceL,
                    ),
                    _cardOption('3D Secure',
                        'Secure online payments through double verification by SMS.'),
                  ],
                ),
                const SizedBox(
                  height: LayoutConstants.spaceL,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: PaletteColor.greyLight,
                        borderRadius:
                            BorderRadius.circular(LayoutConstants.radiusM)),
                    child: const Padding(
                      padding: EdgeInsets.all(LayoutConstants.paddingS),
                      child: BodyText1(
                          content:
                              'No online transaction fees, no monthly fees, instant payment notification, 24/7 customer support.',
                          color: PaletteColor.dark),
                    ))
              ],
            )));
  }

  Widget _cardOption(String title, content) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleIcon(
              size: 50,
              color: PaletteColor.primaryLight.withOpacity(0.1),
              child: SvgPicture.asset(IconsConstants.checkIcon)),
          const SizedBox(
            width: LayoutConstants.spaceM,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyText1(content: title, color: PaletteColor.dark),
                const SizedBox(
                  height: LayoutConstants.spaceS,
                ),
                // Expanded(
                // child:
                Text(
                  content,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(
                    color: PaletteColor.dark,
                    fontFamily: FontsFamilyConstants.fontMedium,
                    fontWeight: FontWeight.w400,
                    fontSize: FontsSizeConstants.bodytext1,
                  ),
                ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

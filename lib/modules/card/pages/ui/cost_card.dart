import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/widget.dart';

import '../../../common/constants/constants.dart';

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
                SubTitle1(
                    content: 'Cost of the card', color: PaletteColor.greyDark),
                SizedBox(height: LayoutConstants.spaceS),
                Title3(content: 'FCFA 10,000', color: PaletteColor.dark),
                SizedBox(height: LayoutConstants.spaceL),
                Divider(
                  thickness: 1,
                  color: PaletteColor.grey,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: PaletteColor.greyLight,
                        borderRadius:
                            BorderRadius.circular(LayoutConstants.radiusM)),
                    child: Padding(
                      padding: EdgeInsets.all(LayoutConstants.paddingS),
                      child: BodyText1(
                          content:
                              'No online transaction fees, no monthly fees, instant payment notification, 24/7 customer support.',
                          color: PaletteColor.dark),
                    ))
              ],
            )));
  }
}

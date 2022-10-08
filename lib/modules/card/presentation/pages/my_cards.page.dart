import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnipay/modules/card/presentation/pages/ui/action_button_card.dart';
import 'package:omnipay/modules/card/presentation/pages/ui/card_details.dart';
import 'package:omnipay/modules/common/widget.dart';

import '../../../common/constants/constants.dart';
import 'ui/credit_card.dart';

class MyCardsPage extends StatelessWidget {
  const MyCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: PaletteColor.greyLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: LayoutConstants.appBarSize,
        flexibleSpace: AppBarRightButton(
          title: 'My cards', rightEvent: () {}, rigthWidget: _rightWidget(),
          // backEvent: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero,
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero),
        child: Column(
          children: const [
            SizedBox(
              height: LayoutConstants.spaceXL,
            ),
            CreditCard(),
            SizedBox(
              height: LayoutConstants.spaceM,
            ),
            ActionButtonCard(),
            SizedBox(
              height: LayoutConstants.spaceL,
            ),
            CardDetails(),
          ],
        ),
      ),
    );
  }

  Widget _rightWidget() {
    return Padding(
      padding: const EdgeInsets.all(LayoutConstants.spaceS),
      child: Row(
        children: [
          SvgPicture.asset(
            IconsConstants.plusIcon,
            color: PaletteColor.dark,
          ),
          const SizedBox(
            width: LayoutConstants.spaceS,
          ),
          const SubTitle1(content: 'Add a card', color: PaletteColor.dark),
        ],
      ),
    );
  }
}

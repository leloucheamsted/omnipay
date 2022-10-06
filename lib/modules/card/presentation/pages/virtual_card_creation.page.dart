import 'package:flutter/material.dart';
import 'package:omnipay/modules/card/presentation/pages/ui/cost_card.dart';
import 'package:omnipay/modules/card/presentation/pages/ui/credit_card.dart';

import '../../../common/constants/constants.dart';
import '../../../common/widget.dart';

class VirtualCardCreationPage extends StatelessWidget {
  const VirtualCardCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.greyLight,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: LayoutConstants.appBarSize,
          flexibleSpace: BackButtonWithTitleAppBar(
            title: 'Virtual debit card',
            backEvent: () {},
          )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero,
            LayoutConstants.paddingM,
            LayoutConstants.paddingM),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    SizedBox(
                      height: LayoutConstants.spaceXL,
                    ),
                    CreditCard(),
                    SizedBox(
                      height: LayoutConstants.spaceL,
                    ),
                    CostCardWidget()
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: LayoutConstants.spaceM,
            ),
            GetYourCardButton(
              event: () {},
              widget: const Text('data'),
            ),
          ],
        ),
      ),
    );
  }
}

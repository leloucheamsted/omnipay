import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/card/pages/ui/card_creation.dart';
import 'package:omnipay/modules/card/pages/ui/cost_card.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widget.dart';
import 'package:omnipay/modules/common/widgets/textfield/text_field_container.dart';
import 'package:omnipay/modules/common/widgets/textfield/ui/info_widget.dart';
import 'package:omnipay/modules/common/widgets/bottomsheet/choice_amount.dart';
import 'package:omnipay/modules/home/pages/ui/balance_controller.dart';
import 'package:omnipay/modules/notification/ui/alert_bottom_popup.dart';
import 'package:omnipay/modules/users/presentation/auth/pages/ui/input_number.dart';
import 'package:omnipay/modules/users/presentation/auth/pages/ui/input_otp.dart';

class PhoneInputPage extends StatelessWidget {
  const PhoneInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: LayoutConstants.appBarSize,
          flexibleSpace: AppBarRightButton(
              rightEvent: () {}, title: 'title', rightBtnText: 'leou')),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero,
            LayoutConstants.paddingM,
            LayoutConstants.paddingM),
        child: Column(
          children: const [
            BodyText1(
                content:
                    'The phone number you provide will be used to create your account only.',
                color: PaletteColor.dark),
            SizedBox(
              height: LayoutConstants.spaceXL,
            ),
            CostCardWidget()
            // Expanded(
            //   child: Column(
            //     children: [
            //       const InputNumber(),
            //       const SizedBox(
            //         height: LayoutConstants.spaceM,
            //       ),
            //       ContinuButton(event: () {}, widget: Text('data')),
            //     ],
            //   ),
            // ),
            // HelpButton(
            //   event: (() => {}),
            // ),
          ],
        ),
      ),
    );
  }
}

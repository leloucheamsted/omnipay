import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/widget.dart';
import 'package:omnipay/modules/common/widgets/appbar/app_bar.dart';
import 'package:omnipay/modules/home/presentation/pages/ui/recharge_method_item.dart';

import '../../../common/constants/constants.dart';

class RechargeMethodListPage extends StatelessWidget {
  const RechargeMethodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.greyLight,
      appBar: AppBar(
        toolbarHeight: LayoutConstants.appBarSize,
        flexibleSpace: BackButtonWithTitleAppBar(
          backEvent: (() {}),
          title: 'Reload',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero,
            LayoutConstants.paddingM,
            LayoutConstants.paddingM),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: LayoutConstants.spaceXL,
            ),
            const Title3(content: 'Via mobile money', color: PaletteColor.dark),
            const SizedBox(
              height: LayoutConstants.spaceS,
            ),
            GestureDetector(
              child: const RechargeMethodItem(
                  icon: ImagesConstants.mtnImage,
                  paymentType: 'MTN Mobile Money',
                  info: 'Recharge fee: 3%'),
            ),
            const SizedBox(
              height: LayoutConstants.spaceS,
            ),
            GestureDetector(
              child: const RechargeMethodItem(
                  icon: ImagesConstants.orangeImage,
                  paymentType: 'Orange Money',
                  info: 'Recharge fee: 3%'),
            ),
            const SizedBox(
              height: LayoutConstants.spaceM,
            ),
            const Title3(content: 'Via credit card', color: PaletteColor.dark),
            GestureDetector(
              child: const RechargeMethodItem(
                  icon: ImagesConstants.visaImage,
                  paymentType: 'Visa / Mastercard',
                  info: 'Coming soon'),
            ),
          ],
        ),
      ),
    );
  }
}

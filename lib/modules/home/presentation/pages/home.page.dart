import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omnipay/modules/home/presentation/pages/ui/balance_controller.dart';

import '../../../common/constants/constants.dart';
import '../../../common/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: PaletteColor.greyLight,
      appBar: AppBar(
          toolbarHeight: LayoutConstants.appBarSize,
          flexibleSpace: AppBarRightButton(
            //color: PaletteColor.white,
            title: 'Welcome, Abdoul', rigthWidget: _rightChild(),
            rightEvent: () {},
          )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero,
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero),
        child: Column(
          children: [
            const SizedBox(
              height: LayoutConstants.spaceS,
            ),
            const BalanceController(),
            const SizedBox(
              height: LayoutConstants.spaceL,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BodyText1(
                    content: 'Transactions', color: PaletteColor.dark),
                GestureDetector(
                    child: const BodyText1(
                        content: 'See All', color: PaletteColor.primary)),
              ],
            ),
            Expanded(child: _listTransaction())
            //  Recenttansaction(),
          ],
        ),
      ),
    );
  }

  Widget _listTransaction() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(6, (index) {
          return const PaymentMethodItem(
            icon: ImagesConstants.mtnImage,
            transactionType: 'Balance reload',
            dateTime: '12 September 2022 13:54',
            amount: '2,000',
            avatarColor: PaletteColor.danger,
          );
        }),
      ),
    );
  }

  Widget notItem() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            IconsConstants.clockIcon,
            color: PaletteColor.greyDark,
          ),
          const SubTitle2(
              content: 'There are currently no transactions.',
              color: PaletteColor.greyDark),
        ],
      ),
    );
  }

  Widget _rightChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(IconsConstants.helpcircleIcon),
        const SizedBox(
          width: LayoutConstants.spaceS,
        ),
        const SubTitle4(content: 'Help', color: PaletteColor.hinner),
      ],
    );
  }
}

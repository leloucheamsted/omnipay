import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnipay/modules/common/constants/constants.dart';

import '../../../common/widget.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.greyLight,
      appBar: AppBar(
          toolbarHeight: LayoutConstants.appBarSize,
          flexibleSpace: AppBarRightButton(
            //color: PaletteColor.white,
            title: 'Transactions', rigthWidget: _rightChild(),
            rightEvent: () {},
          )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero,
            LayoutConstants.paddingM,
            LayoutConstants.paddingM),
        child: SizedBox(
          child: _listTransaction(),
          //  Column(
          //   children: [],
          // ),
        ),
      ),
    );
  }

  Widget _listTransaction() {
    return Column(
      children: List.generate(6, (index) {
        return const PaymentMethodItem(
          icon: ImagesConstants.mtnImage,
          transactionType: 'Balance reload',
          dateTime: '12 September 2022 13:54',
          amount: '2,000',
          avatarColor: PaletteColor.danger,
        );
      }),
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:omnipay/modules/card/presentation/pages/ui/circle_icon.dart';
import 'package:omnipay/modules/common/widget.dart';
import 'package:omnipay/modules/home/bloc/home_bloc.dart';
import 'package:omnipay/modules/home/presentation/pages/ui/recharge_method_item.dart';
import 'package:provider/provider.dart';

import '../../../common/constants/constants.dart';
import 'ui/enter_number.ui.dart';

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
          title: context.watch<HomeBloc>().typeAction == TypeAction.reload.name
              ? 'Reload'
              : 'Transfer',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingM,
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
              onTap: (() => {_callSheet(context, Operator.mtn.name)}),
              child: const RechargeMethodItem(
                  icon: ImagesConstants.mtnImage,
                  paymentType: 'MTN Mobile Money',
                  info: 'Recharge fee: 3%'),
            ),
            const SizedBox(
              height: LayoutConstants.spaceS,
            ),
            GestureDetector(
              onTap: (() => {_callSheet(context, Operator.orange.name)}),
              child: const RechargeMethodItem(
                  icon: ImagesConstants.orangeImage,
                  paymentType: 'Orange Money',
                  info: 'Recharge fee: 3%'),
            ),
            const SizedBox(
              height: LayoutConstants.spaceM,
            ),
            SizedBox(
              child:
                  context.watch<HomeBloc>().typeAction != TypeAction.reload.name
                      ? _omnipayTrasnfer()
                      : null,
            ),
            const SizedBox(
              height: LayoutConstants.spaceM,
            ),
            const Title3(content: 'Via credit card', color: PaletteColor.dark),
            GestureDetector(
              child: _visacard('Visa / Mastercard', 'Coming soo'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _omnipayTrasnfer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Title3(content: 'Via omnipay', color: PaletteColor.dark),
        const SizedBox(
          height: LayoutConstants.spaceM,
        ),
        GestureDetector(child: _omnicard('Omnipay account', 'Coming soo')),
      ],
    );
  }

  Widget _omnicard(String paymentType, info) {
    return _item(IconsConstants.users, paymentType, info);
  }

  Widget _visacard(String paymentType, info) {
    return _item(IconsConstants.creditcardIcon, paymentType, info);
  }

// item recharge action
  Widget _item(String iconName, typeAction, info) {
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
                    CircleIcon(
                        size: 50,
                        color: PaletteColor.primary,
                        child: SvgPicture.asset(
                          iconName,
                          color: PaletteColor.white,
                        )),
                    const SizedBox(
                      width: LayoutConstants.spaceM,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BodyText1(
                            content: typeAction, color: PaletteColor.dark),
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

// call boutton function
  void _callSheet(BuildContext context, String operator) {
    context.read<HomeBloc>().changeOperator(operator);
    _enterNumberSheet(context);
  }

// bottom sheet view
  void _enterNumberSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Form(key: key, child: const EnterNumberWidget());
        });
  }
}

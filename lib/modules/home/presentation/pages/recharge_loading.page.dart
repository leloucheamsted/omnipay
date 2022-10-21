import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widget.dart';
import 'package:omnipay/modules/common/widgets/appbar/blank_app_bar.dart';
import 'package:omnipay/modules/common/widgets/button/dial_button.dart';
import 'package:omnipay/modules/home/presentation/bloc/home_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../routes/app_pages.dart';
import 'ui/push_notification.dart';

class RechargeLoadingPage extends StatelessWidget {
  const RechargeLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.greyLight,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: LayoutConstants.appBarSize,
          flexibleSpace: const BlanckAppBar()),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero,
            LayoutConstants.paddingM,
            LayoutConstants.paddingM),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Image.asset(ImagesConstants.dialImage),
                  const Title3(
                      content: 'Reloading in progress',
                      color: PaletteColor.dark),
                  const SizedBox(
                    height: LayoutConstants.spaceM,
                  ),
                  const BodyText1(
                      textAlign: TextAlign.center,
                      content:
                          'You will receive a payment request on your phone. If you don\'t, please click the button below to manually start it and complete the payment.',
                      color: PaletteColor.dark),
                ],
              ),
            ),
            Column(
              children: [
                DialButton(
                    event: () => context.read<HomeBloc>().changeStatus(context),
                    widget: const Text('')),
                const SizedBox(
                  height: LayoutConstants.spaceM,
                ),
                _close(context)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _close(context) {
    return Material(
      color: Colors.white.withOpacity(0.0),
      child: InkWell(
        onTap: (() {
          Get.offAllNamed(Routes.HOME);
          ScaffoldMessenger.of(context).showSnackBar(pushReloadSucces);
        }),
        borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
        child: Ink(
          decoration: BoxDecoration(
              color: PaletteColor.white,
              borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Colors.white12,
                    blurRadius: 30.0,
                    offset: Offset(0.0, 0.75))
              ]),
          child: _transfertButton(),
        ),
      ),
    );
  }

  Widget _transfertButton() {
    return Container(
      alignment: Alignment.center,
      height: LayoutConstants.btnHeight,
      decoration: BoxDecoration(
          // color: PaletteColor.primary,
          borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.white12,
                blurRadius: 30.0,
                offset: Offset(0.0, 0.75))
          ]),
      child: const Padding(
          padding: EdgeInsets.all(LayoutConstants.paddingS),
          child: BodyText1(content: 'Close', color: PaletteColor.dark)),
    );
  }
}

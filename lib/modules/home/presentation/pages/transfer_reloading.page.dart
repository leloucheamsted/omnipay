import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widget.dart';
import 'package:omnipay/modules/common/widgets/appbar/blank_app_bar.dart';
import 'package:omnipay/modules/common/widgets/button/activenotif_button.dart';
import 'package:omnipay/modules/common/widgets/button/dial_button.dart';

class TransferReloadingPage extends StatelessWidget {
  const TransferReloadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.greyLight,
      appBar: AppBar(
          toolbarHeight: LayoutConstants.appBarSize,
          flexibleSpace: const BlanckAppBar()),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero,
            LayoutConstants.paddingM,
            LayoutConstants.paddingM),
        child: Column(children: [
          Expanded(
            child: Column(
              children: [
                Image.asset(ImagesConstants.transferImage),
                const Title3(
                    content: 'Transfer in progress', color: PaletteColor.dark),
                const SizedBox(
                  height: LayoutConstants.spaceM,
                ),
                const BodyText1(
                    textAlign: TextAlign.center,
                    content:
                        'It usually takes a few minutes before you receive your transfer to your mobile money account. Click the button below to continue using your app while we process your transfer.',
                    color: PaletteColor.dark),
              ],
            ),
          ),
          _close()
        ]),
      ),
    );
  }

  Widget _close() {
    return Material(
      color: Colors.white.withOpacity(0.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
        child: Ink(
          decoration: BoxDecoration(
              color: PaletteColor.primary,
              borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Colors.white12,
                    blurRadius: 30.0,
                    offset: Offset(0.0, 0.75))
              ]),
          child: _transfertButton(),
        ),
        onTap: () {},
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
      child: Padding(
          padding: const EdgeInsets.all(LayoutConstants.paddingS),
          child: const BodyText1(content: 'Close', color: PaletteColor.white)),
    );
  }
}
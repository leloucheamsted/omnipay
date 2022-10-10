import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../common/constants/constants.dart';
import '../../../common/widget.dart';
import '../../../common/widgets/appbar/blank_app_bar.dart';

class CreationCardConfirmationPage extends StatelessWidget {
  const CreationCardConfirmationPage({super.key});

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
                  Image.asset(ImagesConstants.creditcardImage),
                  const Title3(
                      content: 'Creation of your card in progress',
                      color: PaletteColor.dark),
                  const SizedBox(
                    height: LayoutConstants.spaceM,
                  ),
                  const BodyText1(
                      textAlign: TextAlign.center,
                      content:
                          'Creating and activating your card usually takes a few minutes. You will be notified when it is finished. To continue using your app, click the button below.',
                      color: PaletteColor.dark),
                ],
              ),
            ),
            ClosesButton(
                event: () {
                  Get.offAllNamed(Routes.HOME);
                },
                widget: const Text(''))
          ],
        ),
      ),
    );
  }
}

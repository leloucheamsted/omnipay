import 'package:flutter/material.dart';

import '../../../common/constants/constants.dart';
import '../../../common/widget.dart';
import '../../../common/widgets/appbar/blank_app_bar.dart';

class NoCardPage extends StatelessWidget {
  const NoCardPage({super.key});

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
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Image.asset(ImagesConstants.creditcardImage),
                  const Title3(
                      content: 'You have no cards', color: PaletteColor.dark),
                  const SizedBox(
                    height: LayoutConstants.spaceM,
                  ),
                  const BodyText1(
                      textAlign: TextAlign.center,
                      content:
                          'Create a new card to start enjoying the limitless possibilities of omnipay.',
                      color: PaletteColor.dark),
                ],
              ),
            ),
            CreateNewCardButton(event: () {}, widget: const Text(''))
          ],
        ),
      ),
    );
  }
}

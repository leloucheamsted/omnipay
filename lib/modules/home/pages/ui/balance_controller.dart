import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/constants/constants.dart';
import '../../../common/widget.dart';

class BalanceController extends StatelessWidget {
  BalanceController({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    late double width = (MediaQuery.of(context).size.width - 60) / 2;
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
          color: PaletteColor.white,
          borderRadius: BorderRadius.circular(LayoutConstants.radiusM),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.white12,
                blurRadius: 30.0,
                offset: Offset(0.0, 0.75))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(LayoutConstants.paddingS),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(LayoutConstants.paddingS / 2),
              child: Column(
                children: [
                  const BodyText2(
                      content: 'Available balance', color: PaletteColor.dark),
                  const SizedBox(
                    height: LayoutConstants.spaceS,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Title2(content: 'FCFA', color: PaletteColor.dark),
                      const SizedBox(
                        width: LayoutConstants.spaceS,
                      ),
                      _balanceText(),
                    ],
                  )
                ],
              ),
            ),
            _buttonaction(width),
          ],
        ),
      ),
    );
  }

  // Balance Text

  Widget _balanceText() {
    return const Title2(content: '15,000', color: PaletteColor.dark);
  }

  Widget _reloadButton(double width) {
    return Container(
      alignment: Alignment.center,
      height: LayoutConstants.btnHeight,
      width: width,
      decoration: BoxDecoration(
          color: PaletteColor.primary,
          borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.white12,
                blurRadius: 30.0,
                offset: Offset(0.0, 0.75))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(LayoutConstants.paddingS),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(IconsConstants.plusIcon),
            const SizedBox(
              width: LayoutConstants.spaceS,
            ),
            const BodyText1(content: 'Reload', color: PaletteColor.white)
          ],
        ),
      ),
    );
  }

  Widget _transfertButton(double width) {
    return Container(
      alignment: Alignment.center,
      height: LayoutConstants.btnHeight,
      width: width,
      decoration: BoxDecoration(
          color: PaletteColor.primary,
          borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.white12,
                blurRadius: 30.0,
                offset: Offset(0.0, 0.75))
          ]),
      child: Padding(
          padding: const EdgeInsets.all(LayoutConstants.paddingS),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(IconsConstants.transfertIcon),
              const SizedBox(
                width: LayoutConstants.spaceS,
              ),
              const BodyText1(content: 'Transfer', color: PaletteColor.white)
            ],
          )),
    );
  }

  Widget _buttonaction(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_reloadButton(width), _transfertButton(width)],
    );
  }
}

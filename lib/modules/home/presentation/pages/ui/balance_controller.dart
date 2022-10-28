import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omnipay/modules/home/presentation/bloc/home_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/widget.dart';
import './reload_widget.dart';

class BalanceController extends StatelessWidget {
  final String balance;
  const BalanceController({
    super.key,
    required this.balance,
  });
  @override
  Widget build(BuildContext context) {
    late double width = (MediaQuery.of(context).size.width - 60) / 2;
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      //  height: 180,
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
            const SizedBox(
              height: LayoutConstants.spaceXL,
            ),
            _buttonaction(width, context),
          ],
        ),
      ),
    );
  }

  // Balance Text

  Widget _balanceText() {
    return Title2(content: balance, color: PaletteColor.dark);
  }

  Widget _reloadButton(double width) {
    return Container(
      alignment: Alignment.center,
      height: LayoutConstants.btnHeight,
      width: width,
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

  Widget _buttonaction(double width, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.white.withOpacity(0.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
            child: Ink(
                decoration: BoxDecoration(
                    color: PaletteColor.primary,
                    borderRadius:
                        BorderRadius.circular(LayoutConstants.radiusS),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                          color: Colors.white12,
                          blurRadius: 30.0,
                          offset: Offset(0.0, 0.75))
                    ]),
                child: _reloadButton(width)),
            onTap: () {
              _actionButtonFunc(context, TypeAction.reload.name);
            },
          ),
        ),
        Material(
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
              child: _transfertButton(width),
            ),
            onTap: () {
              _actionButtonFunc(context, TypeAction.transfer.name);
            },
          ),
        )
        // IconCustomButton(
      ],
    );
  }

  _actionButtonFunc(BuildContext context, String operation) {
    log("info: show reload amout pop with $operation operation");
    context.read<HomeBloc>().changeTypeAction(operation);
    _relaodSheet(context);
  }

  void _relaodSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Form(key: key, child: const ReloadWidget());
        });
  }
}

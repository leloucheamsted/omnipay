import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/widget.dart';

class LogoutWarning extends StatelessWidget {
  const LogoutWarning({super.key});

  @override
  Widget build(BuildContext context) {
    late double width = (MediaQuery.of(context).size.width - 60) / 2;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: const BoxDecoration(
              color: PaletteColor.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(LayoutConstants.radiusM),
                topRight: Radius.circular(LayoutConstants.radiusM),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(LayoutConstants.paddingM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottomSheetHeader(
                      onClose: () => closeReloadView(context), title: 'Logout'),
                  const SizedBox(
                    height: LayoutConstants.spaceL,
                  ),
                  const BodyText1(
                      content: 'Are you sure you want to log out ?',
                      color: PaletteColor.dark),
                  const SizedBox(
                    height: LayoutConstants.spaceL,
                  ),
                  _buttonaction(width, context)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _cancelButton(double width) {
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
      child: const Padding(
          padding: EdgeInsets.all(LayoutConstants.paddingS),
          child: BodyText1(content: 'Cancel', color: PaletteColor.dark)),
    );
  }

  Widget _confirmButton(double width) {
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
        child: const Padding(
            padding: EdgeInsets.all(LayoutConstants.paddingS),
            child: BodyText1(content: 'Logout', color: PaletteColor.white)));
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
                    color: PaletteColor.greyLight,
                    borderRadius:
                        BorderRadius.circular(LayoutConstants.radiusS),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                          color: Colors.white12,
                          blurRadius: 30.0,
                          offset: Offset(0.0, 0.75))
                    ]),
                child: _cancelButton(width)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        Material(
          color: Colors.white.withOpacity(0.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
            child: Ink(
              decoration: BoxDecoration(
                  color: PaletteColor.danger,
                  borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Colors.white12,
                        blurRadius: 30.0,
                        offset: Offset(0.0, 0.75))
                  ]),
              child: _confirmButton(width),
            ),
            onTap: () {
              //  _actionButtonFunc(context, TypeAction.transfer.name);
            },
          ),
        )
        // IconCustomButton(
      ],
    );
  }

  void closeReloadView(context) {
    log("info: close logout warning ");
    Navigator.pop(context);
  }
}

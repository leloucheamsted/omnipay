// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:omnipay/modules/card/bloc/cards_bloc.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widgets/button/icontinue_button.dart';
import 'package:provider/provider.dart';

class GetYourCardButton extends StatefulWidget {
  final VoidCallback event;
  final Widget widget;
  const GetYourCardButton(
      {super.key, required this.event, required this.widget});

  @override
  State<GetYourCardButton> createState() => _GetYourCardButtonState();
}

class _GetYourCardButtonState extends State<GetYourCardButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
        splashColor: PaletteColor.white,
        hoverColor: PaletteColor.white,
        onTap: widget.event,
        child: Ink(
            decoration: BoxDecoration(
                color: PaletteColor.primary,
                borderRadius: BorderRadius.circular(LayoutConstants.radiusS)),
            child: IContinueButton(
              widget: SizedBox(
                child: context.watch<CardsBloc>().loadingCard == true
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.5,
                        ))
                    : Text(
                        'Get your card',
                        style: TextStyle(
                          color: PaletteColor.white,
                          fontFamily: FontsFamilyConstants.fontRegular,
                          fontWeight: FontWeight.w400,
                          fontSize: FontsSizeConstants.title3,
                        ),
                      ),
              ),
            )));
  }
}

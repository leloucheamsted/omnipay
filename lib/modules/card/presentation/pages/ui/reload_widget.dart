import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omnipay/modules/card/bloc/cards_bloc.dart';
import 'package:omnipay/modules/card/presentation/pages/ui/push_notification.dart';
import 'package:omnipay/modules/common/widget.dart';
import 'package:omnipay/modules/common/widgets/textfield/text_field_container.dart';
import 'package:provider/provider.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/widgets/button/icontinue_button.dart';

TextEditingController amountController = TextEditingController();

class ReloadWidget extends StatelessWidget {
  const ReloadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
                      onClose: () {
                        closeReloadView(context);
                      },
                      title: 'Reload'),
                  const SizedBox(
                    height: LayoutConstants.spaceL,
                  ),
                  TextFielContainer(
                    showchild: !context.watch<CardsBloc>().isValidAmountR,
                    errorMessage: "errorMessage",
                    alignment: Alignment.centerLeft,
                    typeInfo: !context.watch<CardsBloc>().isValidAmountR
                        ? TypeInfo.error
                        : TypeInfo.message,
                    infoWidget: const ErrorText(
                        content: 'Insufficient balance',
                        color: PaletteColor.danger),
                    messageWidget: const ErrorText(
                        content: 'Min: FCFA 5,000 - Max: 50,000',
                        color: PaletteColor.primary),
                    child: CustomTextField(
                      placeholder: 'Enter the amount to reload',
                      textController: amountController,
                    ),
                  ),
                  const SizedBox(
                    height: LayoutConstants.spaceL,
                  ),
                  _choiceAmount((MediaQuery.of(context).size.width - 60) / 3),
                  const SizedBox(
                    height: LayoutConstants.spaceL,
                  ),
                  _continueButton(context),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _choiceAmount(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _amountWidget('5,000', width),
        _amountWidget('10,000', width),
        _amountWidget('15,000', width),
      ],
    );
  }

  void closeReloadView(context) {
    log("info: close reload card amount pop");
    Navigator.pop(context);
  }

  Widget _amountWidget(String amount, double width) {
    return GestureDetector(
      onTap: () {
        log("info: $amount refill card  has been selected");
        final output = amount.replaceAll(RegExp(','), '');
        amountController.text = int.parse(output).toString();
      },
      child: Container(
        alignment: Alignment.center,
        height: LayoutConstants.btnHeight,
        width: width,
        decoration: BoxDecoration(
            color: PaletteColor.greyLight, // ORIGINAL COLOR IS GRAYLIGHT
            borderRadius: BorderRadius.circular(LayoutConstants.radiusS)),
        child: BodyText2(content: 'FCFA $amount', color: PaletteColor.dark),
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
        splashColor: PaletteColor.white,
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(pushReloading);
          // ignore: curly_braces_in_flow_control_structures
          // if (amountController.text.isNotEmpty) if (context
          //         .read<CardsBloc>()
          //         .verifyAmount(int.parse(amountController.text)) ==
          //     true) {
          //   if (kDebugMode) {
          //     print(context
          //         .read<CardsBloc>()
          //         .verifyAmount(int.parse(amountController.text)));
          //   }
          //   Navigator.pop(context);
          // }
        },
        child: Container(
            decoration: BoxDecoration(
                color: PaletteColor.primary,
                borderRadius: BorderRadius.circular(LayoutConstants.radiusS)),
            child: IContinueButton(
              widget: Text(
                'Continue',
                style: TextStyle(
                  color: PaletteColor.white,
                  fontFamily: FontsFamilyConstants.fontRegular,
                  fontWeight: FontWeight.w400,
                  fontSize: FontsSizeConstants.title3,
                ),
              ),
            )));
  }
}

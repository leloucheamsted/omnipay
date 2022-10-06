import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omnipay/modules/common/widget.dart';
import 'package:omnipay/modules/common/widgets/textfield/text_field_container.dart';
import 'package:omnipay/modules/home/bloc/home_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/widgets/button/icontinue_button.dart';
import '../recharge_method_list.page.dart';

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
                      onClose: () => closeReloadView(context),
                      title: context.watch<HomeBloc>().typeAction ==
                              TypeAction.reload.name
                          ? 'Reload'
                          : 'Transfer'),
                  const SizedBox(
                    height: LayoutConstants.spaceL,
                  ),
                  TextFielContainer(
                    showchild: !context.watch<HomeBloc>().isValidAmountR,
                    errorMessage: "errorMessage",
                    alignment: Alignment.centerLeft,
                    typeInfo: !context.watch<HomeBloc>().isValidAmountR
                        ? TypeInfo.error
                        : TypeInfo.message,
                    infoWidget: const ErrorText(
                        content: 'Enter your last name here.',
                        color: PaletteColor.danger),
                    messageWidget: const ErrorText(
                        content: 'Min: FCFA 5,000 - Max: 50,000',
                        color: PaletteColor.primary),
                    child: CustomTextField(
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      textInputType: TextInputType.number,
                      placeholder:
                          'Enter the amount to ${context.watch<HomeBloc>().typeAction}',
                      textController: amountController,
                    ),
                  ),
                  const SizedBox(
                    height: LayoutConstants.spaceL,
                  ),
                  _choiceAmount(
                    (MediaQuery.of(context).size.width - 60) / 3,
                  ),
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

  void closeReloadView(context) {
    log("info: close reload amount pop");
    Navigator.pop(context);
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

  Widget _amountWidget(String amount, double width) {
    return GestureDetector(
      onTap: () {
        log("info: $amount refill has been selected");
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
        //hoverColor: PaletteColor.white,
        onTap: () {
          // ignore: curly_braces_in_flow_control_structures
          if (amountController.text.isNotEmpty) if (context
                  .read<HomeBloc>()
                  .verifyAmount(int.parse(amountController.text)) ==
              true) {
            if (kDebugMode) {
              print(context
                  .read<HomeBloc>()
                  .verifyAmount(int.parse(amountController.text)));
            }
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RechargeMethodListPage()));
            // MaterialPageRoute(builder: (context) => RechargeMethodListPage());
          }
        },
        child: Container(
            decoration: BoxDecoration(
                color: PaletteColor.primary,
                borderRadius: BorderRadius.circular(LayoutConstants.radiusS)),
            child: IContinueButton(
              widget:
                  //;
                  Text(
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

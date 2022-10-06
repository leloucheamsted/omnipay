import 'package:flutter/material.dart';
import 'package:omnipay/modules/card/presentation/pages/ui/bottomsheet/choice_amount.dart';
import 'package:omnipay/modules/common/widget.dart';
import 'package:omnipay/modules/common/widgets/textfield/text_field_container.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/widgets/button/icontinue_button.dart';

class ReloadWidget extends StatelessWidget {
  const ReloadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
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
                  BottomSheetHeader(onClose: () {}, title: 'Reload'),
                  const SizedBox(
                    height: LayoutConstants.spaceL,
                  ),
                  TextFielContainer(
                    showchild: false,
                    errorMessage: "errorMessage",
                    alignment: Alignment.centerLeft,
                    typeInfo: TypeInfo.message,
                    infoWidget: const ErrorText(
                        content: 'Enter your last name here.',
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
                  ChoiceAmount(
                      width: (MediaQuery.of(context).size.width - 60) / 3,
                      amount: '5,000'),
                  const SizedBox(
                    height: LayoutConstants.spaceL,
                  ),
                  _continueButton(context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
        splashColor: PaletteColor.white,
        //hoverColor: PaletteColor.white,
        onTap: () {},
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

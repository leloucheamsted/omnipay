import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnipay/modules/common/widget.dart';
import 'package:omnipay/modules/common/widgets/textfield/text_field_container.dart';
import 'package:omnipay/modules/home/presentation/bloc/home_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/widgets/button/icontinue_button.dart';

TextEditingController phoneController = TextEditingController();

class EnterNumberWidget extends StatefulWidget {
  const EnterNumberWidget({super.key});

  @override
  State<EnterNumberWidget> createState() => _EnterNumberWidgetState();
}

class _EnterNumberWidgetState extends State<EnterNumberWidget> {
  bool iserror = false;

  @override
  void dispose() {
    phoneController.clear();
    super.dispose();
  }

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
                      title: context.watch<HomeBloc>().operator ==
                              Operator.mtn.name
                          ? 'MTN Mobile money'
                          : 'Orange Mobile Money'),
                  const SizedBox(
                    height: LayoutConstants.spaceL,
                  ),
                  TextFielContainer(
                    showchild: iserror,
                    errorMessage: "errorMessage",
                    alignment: Alignment.centerLeft,
                    typeInfo:
                        iserror == true ? TypeInfo.error : TypeInfo.message,
                    infoWidget: const ErrorText(
                        content: 'Enter a valid mobile money number.',
                        color: PaletteColor.danger),
                    messageWidget: Row(
                      children: [
                        SvgPicture.asset(IconsConstants.lockIcon,
                            color: PaletteColor.primary),
                        const SizedBox(
                          width: LayoutConstants.spaceS,
                        ),
                        ErrorText(
                            content:
                                'Processed securely by ${context.watch<HomeBloc>().operator.toString().toUpperCase()} Mobile Money',
                            color: PaletteColor.primary),
                      ],
                    ),
                    child: CustomTextField(
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      textInputType: TextInputType.number,
                      placeholder: 'Enter your mobile money number',
                      textController: phoneController,
                    ),
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
    log("info: close input Phone Number  pop");
    Navigator.pop(context);
  }

  Widget _continueButton(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
        splashColor: PaletteColor.white,
        //hoverColor: PaletteColor.white,
        onTap: continueFunc,
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

  void continueFunc() {
    if (phoneController.text.isEmpty) {
      setState(() {
        iserror = true;
      });
    } else {
      if (context.read<HomeBloc>().verifyPhoneNumber(phoneController.text) ==
          false) {
        setState(() {
          iserror = true;
        });
      } else {
        setState(() {
          iserror = false;
        });
      }
    }
  }
}

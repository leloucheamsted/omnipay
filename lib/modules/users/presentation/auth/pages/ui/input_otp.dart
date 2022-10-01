import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/constants/font_family_constants.dart';
import 'package:omnipay/modules/common/constants/font_size_contants.dart';
import 'package:omnipay/modules/users/presentation/auth/bloc/auth_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../common/widget.dart';

class InputOtp extends StatefulWidget {
  const InputOtp({super.key});

  @override
  State<InputOtp> createState() => _InputOtpState();
}

class _InputOtpState extends State<InputOtp> {
  @override
  Widget build(BuildContext context) {
    return otpTextField();
  }

  Widget otpTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: LayoutConstants.btnHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: context.watch<AuthBloc>().isValidOtp == true
                  // widget.showchild == false || widget.typeInfo != TypeInfo.error
                  ? PaletteColor.grey
                  : PaletteColor.danger,
            ),
            borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                LayoutConstants.paddingS, 8, LayoutConstants.paddingS, 4),
            child: TextField(
              autofocus: true,
              //  controller: _otpTxtCtrl,
              onChanged: ((value) {
                Provider.of<AuthBloc>(context, listen: false).setOtpCode =
                    value;
              }),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 6,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              style: TextStyle(
                  fontSize: FontsSizeConstants.title3,
                  fontFamily: FontsFamilyConstants.fontRegular,
                  fontWeight: FontWeight.w400,
                  color: PaletteColor.dark),
              decoration: InputDecoration(
                border: InputBorder.none,
                counterText: "",
                hintText: 'Enter the Code',
                hintStyle: TextStyle(
                    fontSize: FontsSizeConstants.title3,
                    fontFamily: FontsFamilyConstants.fontRegular,
                    fontWeight: FontWeight.w400,
                    color: PaletteColor.hinner),
              ),
            ),
          ),
        ),
        SizedBox(
          child: context.watch<AuthBloc>().isValidOtp == false
              ? const ErrorText(
                  content: 'Review and enter the code again.',
                  color: PaletteColor.danger)
              : null,
        ),
      ],
    );
  }
}

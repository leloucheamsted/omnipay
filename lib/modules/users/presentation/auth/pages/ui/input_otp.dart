import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/constants/font_family_constants.dart';
import 'package:omnipay/modules/common/constants/font_size_contants.dart';

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
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          LayoutConstants.paddingS, 8, LayoutConstants.paddingS, 4),
      child: TextField(
        autofocus: true,
        //  controller: _otpTxtCtrl,
        // onChanged: bloc.changeOtpCode,
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
    );
  }
}

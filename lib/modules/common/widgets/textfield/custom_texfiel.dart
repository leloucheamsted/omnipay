import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omnipay/modules/common/constants/constants.dart';

class CustomTextField extends StatefulWidget {
  final String placeholder;
  const CustomTextField({super.key, required this.placeholder});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
        textAlign: TextAlign.left,
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

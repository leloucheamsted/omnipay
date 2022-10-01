import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omnipay/modules/common/constants/constants.dart';

class CustomTextField extends StatefulWidget {
  final String placeholder;
  final TextEditingController textController;
  const CustomTextField(
      {super.key, required this.placeholder, required this.textController});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return textTextField();
  }

  Widget textTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          LayoutConstants.paddingS, 8, LayoutConstants.paddingS, 4),
      child: TextField(
        autofocus: true,
        controller: widget.textController,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: FontsSizeConstants.title3,
            fontFamily: FontsFamilyConstants.fontRegular,
            fontWeight: FontWeight.w400,
            color: PaletteColor.dark),
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: "",
          hintText: widget.placeholder,
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

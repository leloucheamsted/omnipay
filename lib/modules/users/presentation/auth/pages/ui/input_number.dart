import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widgets/typography/typo.widget.dart';

class InputNumber extends StatefulWidget {
  const InputNumber({super.key});

  @override
  State<InputNumber> createState() => _InputNumberState();
}

class _InputNumberState extends State<InputNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: LayoutConstants.btnHeight,
      decoration: BoxDecoration(
        border: LayoutConstants.border,
        borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
      ),
      child: Row(
        children: [
          _choiceContryCode(),
          const VerticalDivider(
            thickness: 2,
          ),
          Expanded(child: _buildPhoneInputFiled()),
        ],
      ),
    );
  }

  Widget _choiceContryCode() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          LayoutConstants.paddingS,
          LayoutConstants.paddingZero,
          LayoutConstants.paddingZero,
          LayoutConstants.paddingZero),
      child: Row(
        children: [
          SvgPicture.asset(IconsConstants.cameroonIcon),
          const SizedBox(width: LayoutConstants.spaceS),
          const BodyText1(content: '+237', color: PaletteColor.dark)
        ],
      ),
    );
  }

  Widget _buildPhoneInputFiled() {
    return TextField(
      autofocus: true,
      // controller: _phoneTxtCtrl,
      //onChanged: bloc.changePhone,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.left,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],

      /// Add Text style with decoration
      style: TextStyle(
        color: PaletteColor.dark,
        fontFamily: FontsFamilyConstants.fontRegular,
        fontWeight: FontWeight.w400,
        fontSize: FontsSizeConstants.title3,
      ),
      decoration: InputDecoration.collapsed(
        hintText: 'Enter your phone number',
        hintStyle: TextStyle(
          color: PaletteColor.greyDark,
          fontFamily: FontsFamilyConstants.fontRegular,
          fontWeight: FontWeight.w400,
          fontSize: FontsSizeConstants.title3,
        ),
      ),
    );
  }
}

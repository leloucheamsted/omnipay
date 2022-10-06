import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widgets/typography/typo.widget.dart';
import 'package:omnipay/modules/users/presentation/auth/bloc/auth_bloc.dart';
import 'package:provider/provider.dart';

class InputNumber extends StatefulWidget {
  const InputNumber({super.key});

  @override
  State<InputNumber> createState() => _InputNumberState();
}

class _InputNumberState extends State<InputNumber> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: LayoutConstants.btnHeight,
          decoration: BoxDecoration(
            //  border: LayoutConstants.border,
            border: Border.all(
              width: 1,
              color: context.watch<AuthBloc>().isValidNumber == false
                  ? PaletteColor.danger
                  : PaletteColor.grey,
            ),
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
        ),
        const SizedBox(
          height: LayoutConstants.spaceS,
        ),
        SizedBox(
          child: context.watch<AuthBloc>().isValidNumber == false
              ? const ErrorText(
                  content: 'Enter a valid phone number',
                  color: PaletteColor.danger)
              : null,
        )
      ],
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
      onChanged: ((value) {
        context.read<AuthBloc>().setPhoneNumber = value;
      }),
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

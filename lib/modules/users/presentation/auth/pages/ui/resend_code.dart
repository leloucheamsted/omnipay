import 'package:flutter/material.dart';
import 'package:omnipay/modules/common/constants/palette_color.dart';
import 'package:omnipay/modules/common/widgets/typography/typo.widget.dart';

class ResendCode extends StatelessWidget {
  const ResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SubTitle4(
            content: 'We will resend the code in ', color: PaletteColor.dark),
        SubTitle4(content: '00:30', color: PaletteColor.dark),
        SubTitle4(content: '.', color: PaletteColor.dark),
      ],
    );
  }
}

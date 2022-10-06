import 'package:flutter/material.dart';
import 'package:omnipay/modules/users/presentation/auth/pages/ui/input_otp.dart';
import 'package:omnipay/modules/users/presentation/auth/pages/ui/resend_code.dart';
import 'package:provider/provider.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/widget.dart';
import '../bloc/auth_bloc.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.greyLight,
      appBar: AppBar(
          toolbarHeight: LayoutConstants.appBarSize / 2,
          flexibleSpace: ButtonAppBar(
            backEvent: () {},
          )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero,
            LayoutConstants.paddingM,
            LayoutConstants.paddingS),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Title2(
                content: 'Phone number verification', color: PaletteColor.dark),
            const SizedBox(
              height: LayoutConstants.spaceM,
            ),
            const BodyText1(
                content:
                    'We just sent a 6 digit code by SMS to verify your phone number.',
                color: PaletteColor.dark),
            const SizedBox(
              height: LayoutConstants.spaceXL,
            ),
            const InputOtp(),
            const SizedBox(
              height: LayoutConstants.spaceM,
            ),
            ContinuButton(
                event: () {
                  context.read<AuthBloc>().otpCodeVerification();
                  //if (context.read<AuthBloc>().isValidNumber == true) {
                  // privacyPolicy(context);
                  //  }
                },
                widget: const Text('data')),
            const SizedBox(
              height: LayoutConstants.spaceM,
            ),
            const ResendCode(),
          ],
        ),
      ),
    );
  }
}

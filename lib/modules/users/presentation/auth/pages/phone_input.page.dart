import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widget.dart';

import 'package:omnipay/modules/users/presentation/auth/bloc/auth_bloc.dart';
import 'package:omnipay/modules/users/presentation/auth/pages/ui/input_number.dart';
import 'package:omnipay/modules/users/presentation/auth/pages/ui/pricacy_policy_widget.dart';
import 'package:provider/provider.dart';

class PhoneInputPage extends StatelessWidget {
  const PhoneInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.white,
      appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: LayoutConstants.appBarSize,
          flexibleSpace: const TextAppBar(
            color: PaletteColor.white,
            title: 'Add your phone number',
          )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero,
            LayoutConstants.paddingM,
            LayoutConstants.paddingM),
        child: Column(
          children: [
            const BodyText1(
                content:
                    'The phone number you provide will be used to create your account only.',
                color: PaletteColor.dark),
            const SizedBox(
              height: LayoutConstants.spaceXL,
            ),

            /// ActionButtonCard(),
            //CardDetails()
            Expanded(
              child: Column(
                children: [
                  const InputNumber(),
                  const SizedBox(
                    height: LayoutConstants.spaceM,
                  ),
                  ContinuButton(
                      event: () {
                        if (kDebugMode) {
                          print('object');
                        }
                        context.read<AuthBloc>().phoneNumberVerification();
                        if (context.read<AuthBloc>().isValidNumber == true) {
                          privacyPolicy(context);
                        }
                      },
                      widget: const Text('data')),
                ],
              ),
            ),
            HelpButton(
              event: (() => {}),
            ),
          ],
        ),
      ),
    );
  }

  void privacyPolicy(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return const PrivacyPolicyWidget();
        });
  }
}

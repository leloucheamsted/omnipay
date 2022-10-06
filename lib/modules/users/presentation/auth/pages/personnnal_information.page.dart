import 'package:flutter/material.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widget.dart';

import 'package:omnipay/modules/users/presentation/auth/bloc/auth_bloc.dart';
import 'package:omnipay/modules/users/presentation/auth/pages/ui/input_name.dart'
    as np;
import 'package:omnipay/modules/users/presentation/auth/pages/ui/pricacy_policy_widget.dart';
import 'package:provider/provider.dart';

import 'ui/input_name.dart';

class PersonnalInformationPage extends StatelessWidget {
  const PersonnalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.white,
      appBar: AppBar(
          toolbarHeight: LayoutConstants.appBarSize,
          flexibleSpace: const TextAppBar(
            color: PaletteColor.white,
            title: 'You’re almost done',
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
                    'Fill in your first and last names to complete your account creation.',
                color: PaletteColor.dark),
            const SizedBox(
              height: LayoutConstants.spaceXL,
            ),

            /// ActionButtonCard(),
            //CardDetails()
            Expanded(
              child: Column(
                children: [
                  const np.InputName(),
                  const SizedBox(
                    height: LayoutConstants.spaceM,
                  ),
                  ContinuButton(
                      event: () {
                        context.read<AuthBloc>().setFirstName =
                            firstNameController.text;
                        context.read<AuthBloc>().setLastName =
                            lastNamController.text;
                        context.read<AuthBloc>().namwVerification();
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

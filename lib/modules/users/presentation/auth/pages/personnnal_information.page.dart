import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    var params = Get.parameters["phone"];
    log("Params=>$params");
    return Scaffold(
      backgroundColor: PaletteColor.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
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
            Expanded(
              child: Column(
                children: [
                  const np.InputName(),
                  const SizedBox(
                    height: LayoutConstants.spaceM,
                  ),
                  ContinuButton(
                      event: () {
                        FocusScope.of(context).unfocus();
                        context.read<AuthBloc>().setFirstName =
                            firstNameController.text;
                        context.read<AuthBloc>().setLastName =
                            lastNamController.text;

                        context.read<AuthBloc>().nameVerification({
                          "id": Get.parameters["id"],
                          "phone": Get.parameters["phone"],
                          "token": Get.parameters["token"]
                        });
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

  // ignore: unused_element
  void _createUser(context) {}

  void privacyPolicy(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return const PrivacyPolicyWidget();
        });
  }
}

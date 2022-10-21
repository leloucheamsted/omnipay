import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../common/constants/constants.dart';
import '../../../../../common/widget.dart';
import '../../bloc/auth_bloc.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(children: [
        Container(
          //height: 200,
          decoration: const BoxDecoration(
            color: PaletteColor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(LayoutConstants.radiusM),
              topRight: Radius.circular(LayoutConstants.radiusM),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(LayoutConstants.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImagesConstants.policyImage,
                  height: 150,
                ),
                const Title3(
                    content: 'Privacy Policy', color: PaletteColor.dark),
                const SizedBox(
                  height: LayoutConstants.spaceL,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: FontsFamilyConstants.fontRegular,
                      fontWeight: FontWeight.w400,
                      fontSize: FontsSizeConstants.bodytext1,
                    ),
                    children: const [
                      TextSpan(
                          text:
                              'Before joining, please accept our terms and conditions as well as our privacy policy. We respect your privacy and only request the information necessary to improve your app experience. ',
                          style: TextStyle(
                            color: PaletteColor.dark,
                          )),
                      TextSpan(
                          text: 'Please read your privacy policy',
                          style: TextStyle(color: PaletteColor.primaryLight))
                    ],
                  ),
                ),
                const SizedBox(
                  height: LayoutConstants.spaceL,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidthButton(
                      event: () {
                        log('Privacy policy is closed');
                        Navigator.pop(context);
                      },
                      width: (MediaQuery.of(context).size.width - 37) / 2,
                      content: 'Close',
                      background: PaletteColor.greyLight,
                      textColor: PaletteColor.dark,
                    ),
                    WidthButton(
                      event: () {
                        Navigator.pop(context);
                        context.read<AuthBloc>().verifyPhoneNumber();
                        //   _verifyPhoneNumber(context);
                      },
                      width: (MediaQuery.of(context).size.width - 37) / 2,
                      content: 'Accept',
                      background: PaletteColor.primaryLight,
                      textColor: PaletteColor.white,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  // void _verifyPhoneNumber(context) {
  //   Navigator.pop(context);
  // context.read<AuthBloc>().verifyPhoneNumber();
  //   //Get.toNamed('/otp');
  // }
}

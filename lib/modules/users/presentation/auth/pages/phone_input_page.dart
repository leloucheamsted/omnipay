import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widget.dart';
import 'package:omnipay/modules/common/widgets/textfield/text_field_container.dart';
import 'package:omnipay/modules/common/widgets/textfield/ui/info_widget.dart';
import 'package:omnipay/modules/users/presentation/auth/pages/ui/input_number.dart';
import 'package:omnipay/modules/users/presentation/auth/pages/ui/input_otp.dart';

class PhoneInputPage extends StatelessWidget {
  const PhoneInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: LayoutConstants.appBarSize,
          flexibleSpace: AppBarRightButton(
              rightEvent: () {}, title: 'title', rightBtnText: 'leou')),
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
            TextFielContainer(
                typeInfo: TypeInfo.message,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                showchild: true,
                errorMessage: 'lelouche ',
                infoWidget: const InfoMessage(
                    icon: IconsConstants.lockIcon,
                    message: 'message',
                    color: PaletteColor.primary),
                // const ErrorText(
                //     content: 'lelouche', color: PaletteColor.danger),
                child: const CustomTextField(
                  placeholder: 'First Name',
                )),
            const SizedBox(
              height: LayoutConstants.spaceXL,
            ),
            Expanded(
              child: Column(
                children: [
                  const InputNumber(),
                  const SizedBox(
                    height: LayoutConstants.spaceM,
                  ),
                  ContinuButton(event: () {}, widget: Text('data')),
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
}

import 'package:flutter/material.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widget.dart';
import 'package:omnipay/modules/common/widgets/appbar/blank_app_bar.dart';
import 'package:omnipay/modules/users/presentation/auth/bloc/auth_bloc.dart';
import 'package:provider/provider.dart';

class NotificationPermissionPage extends StatelessWidget {
  const NotificationPermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.greyLight,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: LayoutConstants.appBarSize,
          flexibleSpace: const BlanckAppBar()),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero,
            LayoutConstants.paddingM,
            LayoutConstants.paddingM),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Image.asset(ImagesConstants.notificationImage),
                  const Title3(
                      content: 'Don’t miss anything', color: PaletteColor.dark),
                  const SizedBox(
                    height: LayoutConstants.spaceM,
                  ),
                  const BodyText1(
                      textAlign: TextAlign.center,
                      content:
                          'Receive notifications about your spending, security, promotions, and updates so you can stay informed at all times.',
                      color: PaletteColor.dark),
                ],
              ),
            ),
            ActiveNotifButton(
                event: () {
                  context.read<AuthBloc>().activateNotification();
                },
                widget: const Text(''))
          ],
        ),
      ),
    );
  }
}

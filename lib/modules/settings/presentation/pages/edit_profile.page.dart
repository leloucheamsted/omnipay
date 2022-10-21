import 'package:flutter/material.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/settings/presentation/bloc/settings_bloc.dart';
import 'package:omnipay/modules/settings/presentation/pages/ui/button/save_button.dart';
import 'package:omnipay/modules/settings/presentation/pages/ui/input_name.dart';
import 'package:provider/provider.dart';

import '../../../common/widget.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.greyLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: LayoutConstants.appBarSize,
        flexibleSpace: BackButtonWithTitleAppBar(
          backEvent: (() {}),
          title: 'My Profile',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingM,
            LayoutConstants.paddingM,
            LayoutConstants.paddingM),
        child: Column(
          children: [
            const SizedBox(
              height: LayoutConstants.spaceXL,
            ),
            const InputName(),
            const SizedBox(
              height: LayoutConstants.spaceM,
            ),
            SaveButton(event: () {
              context.read<SettingsBloc>().setFirstName =
                  firstNameController.text;
              context.read<SettingsBloc>().setLastName = lastNamController.text;
              clearInputName();
              context.read<SettingsBloc>().nameVerification();
            })
          ],
        ),
      ),
    );
  }
}

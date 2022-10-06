import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omnipay/modules/common/widget.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:omnipay/modules/settings/bloc/settings_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../common/constants/constants.dart';
import '../../../bloc/settings_list.dart';

class SettingsItem extends StatelessWidget {
  final SettingsEntity settingsEntity;
  const SettingsItem({super.key, required this.settingsEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: LayoutConstants.spaceS),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: PaletteColor.white,
            borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.white12,
                  blurRadius: 30.0,
                  offset: Offset(0.0, 0.75))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(
            LayoutConstants.paddingS,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    settingsEntity.icon,
                    color: PaletteColor.primary,
                  ),
                  const SizedBox(
                    width: LayoutConstants.spaceM,
                  ),
                  BodyText1(
                      content: settingsEntity.title, color: PaletteColor.dark),
                ],
              ),
              SizedBox(
                child: settingsEntity.isnotif == true
                    ? FlutterSwitch(
                        height: 35,
                        width: 60,
                        toggleSize: 20.0,
                        inactiveColor: PaletteColor.greyLight,
                        activeColor: PaletteColor.primaryLight.withOpacity(0.1),
                        toggleColor: PaletteColor.primary,
                        value: context.watch<SettingsBloc>().actifNotif,
                        borderRadius: 30.0,
                        padding: 5.0,
                        showOnOff: false,
                        onToggle: (val) {
                          context.read<SettingsBloc>().changeStatutNotif();
                          // setState(() {
                          //   status = val;
                          // });
                        },
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

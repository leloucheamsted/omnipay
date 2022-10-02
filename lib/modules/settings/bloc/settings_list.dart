import 'package:flutter/material.dart';
import 'package:omnipay/modules/common/constants/icons_constants.dart';

class SettingsEntity {
  final String title;
  final String icon;
  final bool? isnotif;
  final Function function;

  const SettingsEntity({
    this.isnotif,
    required this.title,
    required this.icon,
    required this.function,
  });
}

final List<SettingsEntity> settingsList = [
  SettingsEntity(
    title: 'My Profile',
    icon: IconsConstants.userIcon,
    function: (p0) => {},
  ),
  SettingsEntity(
    title: 'Notifications',
    isnotif: true,
    icon: IconsConstants.notificationIcon,
    function: (p0) => {},
  ),
  SettingsEntity(
    title: 'Share',
    icon: IconsConstants.shareIcon,
    function: (p0) => {},
  ),
  SettingsEntity(
    title: 'Privacy policy',
    icon: IconsConstants.policyIcon,
    function: (p0) => {},
  ),
  SettingsEntity(
    title: 'Terms of use',
    icon: IconsConstants.phoneIcon,
    function: (p0) => {},
  ),
  SettingsEntity(
    title: 'Rate the app',
    icon: IconsConstants.rateIcon,
    function: (p0) => {},
  ),
];

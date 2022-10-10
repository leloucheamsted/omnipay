import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../modules/card/cards_module.dart';
import '../modules/home/home_module.dart';
import '../modules/navigation/presentation/nav_bar.page.dart';
import '../modules/settings/presentation/pages/edit_profile.page.dart';
import '../modules/users/users_module.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(name: _Paths.HOME, page: () => const NavBarPage()),
    GetPage(name: _Paths.AUTH, page: () => const PhoneInputPage()),
    GetPage(name: _Paths.OTP, page: () => const OtpPage()),
    GetPage(
        name: _Paths.USERCREATE, page: () => const PersonnalInformationPage()),
    GetPage(name: _Paths.NOTIF, page: () => const NotificationPermissionPage()),
    GetPage(name: _Paths.EDITPROFILE, page: () => const EditProfilePage()),
    GetPage(name: _Paths.NEWCARD, page: () => const NewCardCreationPage()),
    GetPage(
        name: _Paths.VIRTUALCARD, page: () => const VirtualCardCreationPage()),
    GetPage(
        name: _Paths.TRANSFERLOADING,
        page: () => const TransferReloadingPage()),
    GetPage(
        name: _Paths.RECHARGELOADING, page: () => const RechargeLoadingPage()),
    GetPage(name: "/method/", page: () => const RechargeMethodListPage()),
    GetPage(
        name: _Paths.CARDCONFIRM,
        page: () => const CreationCardConfirmationPage()),
  ];
}

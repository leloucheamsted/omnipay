import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:omnipay/modules/card/bloc/cards_bloc.dart';
import 'package:omnipay/modules/home/bloc/home_bloc.dart';
import 'package:omnipay/modules/settings/bloc/settings_bloc.dart';
import 'package:omnipay/modules/settings/presentation/pages/edit_profile.page.dart';
import 'package:omnipay/modules/users/presentation/auth/bloc/auth_bloc.dart';
import 'package:omnipay/routes/app_routes.enum.dart';
import 'package:provider/provider.dart';
import 'modules/common/constants/constants.dart';
import 'modules/navigation/bloc/nav_bloc.dart';
import 'modules/navigation/presentation/nav_bar.page.dart';
import './modules/users/users_module.dart';
import './modules/home/home_module.dart';
import './modules/card/cards_module.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // status bar color
        systemNavigationBarDividerColor: PaletteColor.white,
        systemNavigationBarColor: PaletteColor.white));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthBloc(),
        ),
        ChangeNotifierProvider(
          create: (_) => SettingsBloc(),
        ),
        ChangeNotifierProvider(
          create: (_) => CardsBloc(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeBloc(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeConstants.theme,
        home: const PhoneInputPage(),
        getPages: [
          GetPage(
              name: AppRoute.auth.pathAsChild,
              page: () => const PhoneInputPage()),
          GetPage(name: AppRoute.otp.pathAsChild, page: () => const OtpPage()),
          GetPage(
              name: AppRoute.userCreate.pathAsChild,
              page: () => const PersonnalInformationPage()),
          GetPage(
              name: '/notif', page: () => const NotificationPermissionPage()),
          GetPage(name: '/home', page: () => const NavBarPage()),
          GetPage(name: '/edit/profile', page: () => const EditProfilePage()),
          GetPage(name: '/new/card/', page: () => const CardCreation()),
          GetPage(
              name: "/virtual/card/",
              page: () => const VirtualCardCreationPage()),
          GetPage(
              name: "/transfer/loading/",
              page: () => const TransferReloadingPage()),
          GetPage(
              name: "/recharge/loading/",
              page: () => const RechargeLoadingPage()),
          GetPage(name: "/method/", page: () => const RechargeMethodListPage()),
          GetPage(
              name: "/card/confirm/",
              page: () => const CreationCardConfirmationPage()),
        ],
        initialRoute: '/home',
      ),
    );
  }
}

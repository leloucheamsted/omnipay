import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:omnipay/modules/card/bloc/cards_bloc.dart';
import 'package:omnipay/modules/card/presentation/pages/add_another_card.page.dart';
import 'package:omnipay/modules/card/presentation/pages/creation_card_confirmation.page.dart';
import 'package:omnipay/modules/card/presentation/pages/my_cards_empty.page.dart';
import 'package:omnipay/modules/card/presentation/pages/new_card_creation.page.dart';
import 'package:omnipay/modules/card/presentation/pages/virtual_card_creation.page.dart';
import 'package:omnipay/modules/common/constants/palette_color.dart';
import 'package:omnipay/modules/common/constants/theme_constants.dart';
import 'package:omnipay/modules/home/bloc/home_bloc.dart';
import 'package:omnipay/modules/home/presentation/pages/home.page.dart';
import 'package:omnipay/modules/home/presentation/pages/recharge_method_list.page.dart';
import 'package:omnipay/modules/home/presentation/pages/transfer_reloading.page.dart';
import 'package:omnipay/modules/settings/bloc/settings_bloc.dart';
import 'package:omnipay/modules/settings/presentation/pages/settings.page.dart';
import 'package:omnipay/modules/transactions/presentation/pages/transactions.page.dart';
import 'package:omnipay/modules/users/presentation/auth/bloc/auth_bloc.dart';
import 'package:omnipay/modules/users/presentation/auth/pages/notification_permission.page.dart';
import 'package:omnipay/modules/users/presentation/auth/pages/otp.page.dart';
import 'package:omnipay/modules/users/presentation/auth/pages/personnnal_information.page.dart';
import 'package:omnipay/modules/users/presentation/auth/pages/phone_input.page.dart';
import 'package:provider/provider.dart';

import 'modules/home/presentation/pages/recharge_loading.page.dart';
import 'modules/navigation/bloc/nav_bloc.dart';
import 'modules/navigation/presentation/nav_bar.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        home: const TransferReloadingPage(),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:omnipay/modules/card/presentation/bloc/cards_bloc.dart';
import 'package:omnipay/modules/home/presentation/bloc/home_bloc.dart';
import 'package:omnipay/modules/settings/presentation/bloc/settings_bloc.dart';
import 'package:omnipay/modules/users/presentation/auth/bloc/auth_bloc.dart';
import 'package:omnipay/routes/app_pages.dart';
import 'package:provider/provider.dart';
import 'modules/common/constants/constants.dart';
import 'modules/navigation/presentation/bloc/nav_bloc.dart';
import './modules/users/users_module.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // InitialBinding().dependencies();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    String? token;
    // ignore: prefer_const_constructors
    late FlutterSecureStorage secureStorage = FlutterSecureStorage();
    // late final getStorage = GetStorage();
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
        onInit: (() async {
          token = await secureStorage.read(key: 'tokenKey');
          log("TokenValue=> $token");
        }),
        debugShowCheckedModeBanner: false,
        theme: ThemeConstants.theme,
        home: const PhoneInputPage(),
        getPages: AppPages.routes,
        // ignore: unrelated_type_equality_checks, unnecessary_null_comparison
        initialRoute: token == null ? Routes.AUTH : Routes.HOME,
      ),
    );
  }
}

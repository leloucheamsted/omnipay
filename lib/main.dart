import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:omnipay/modules/card/bloc/cards_bloc.dart';
import 'package:omnipay/modules/home/bloc/home_bloc.dart';
import 'package:omnipay/modules/settings/bloc/settings_bloc.dart';
import 'package:omnipay/modules/users/presentation/auth/bloc/auth_bloc.dart';
import 'package:omnipay/routes/app_pages.dart';
import 'package:provider/provider.dart';
import 'modules/common/constants/constants.dart';
import 'modules/navigation/bloc/nav_bloc.dart';
import './modules/users/users_module.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // InitialBinding().dependencies();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    late final getStorage = GetStorage();
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
        getPages: AppPages.routes,
        initialRoute: getStorage.read('id') == null ? Routes.AUTH : Routes.HOME,
      ),
    );
  }
}

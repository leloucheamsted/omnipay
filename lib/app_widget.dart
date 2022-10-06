// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:omnipay/routes/app_routes.enum.dart';
// import 'package:omnipay/routes/nav_observer.dart';

// import 'modules/common/constants/constants.dart';

// class AppWidget extends StatelessWidget {
//   const AppWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent, // status bar color
//         systemNavigationBarDividerColor: PaletteColor.white,
//         systemNavigationBarColor: PaletteColor.white));
//     // Modular.setNavigatorKey(DialogService.navigationKey);
//     Modular.setInitialRoute(AppRoute.auth.pathAsChild);
//     // Modular.setObservers([Modular.get<NavObserver>()]);
//     return MaterialApp.router(
//       themeMode: ThemeMode.light,
//       debugShowCheckedModeBanner: false,
//       title: "Onmipay",
//       routeInformationParser: Modular.routeInformationParser,
//       routerDelegate: Modular.routerDelegate,
//     );
//   }
// }

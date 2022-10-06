// import 'package:flutter_modular/flutter_modular.dart';

// import 'package:omnipay/modules/navigation/presentation/nav_bar.page.dart';
// import 'package:omnipay/modules/users/presentation/auth/pages/phone_input.page.dart';

// import 'modules/users/presentation/auth/bloc/auth_bloc.dart';
// import 'modules/users/presentation/auth/pages/otp.page.dart';

// class AppModule extends Module {
//   @override
//   List<Bind> get binds => [
//         Bind.lazySingleton((i) => AuthBloc(), export: false),
//       ];

//   @override
//   List<ModularRoute> get routes => [
//         ChildRoute('/', child: (context, args) => const PhoneInputPage()),
//         ChildRoute('/otp', child: (context, args) => const OtpPage()),
//         // ChildRoute(AppRoute.userCreate.name,
//         //     child: (context, args) => const PersonnalInformationPage()),
//         // ChildRoute(AppRoute.notif.name,
//         //     child: (context, args) => const NotificationPermissionPage()),
//         ChildRoute("/home", child: (context, args) => const NavBarPage()),
//         // ChildRoute(AppRoute.newCard.name,
//         //     child: (context, args) => const CardCreation()),
//         // ChildRoute(AppRoute.virtualCard.name,
//         //     child: (context, args) => const VirtualCardCreationPage()),
//         // ChildRoute(AppRoute.tLoading.name,
//         //     child: (context, args) => const TransferReloadingPage()),
//         // ChildRoute(AppRoute.rLoading.name,
//         //     child: (context, args) => const RechargeLoadingPage()),
//         // ChildRoute(AppRoute.methodList.name,
//         //     child: (context, args) => const RechargeMethodListPage()),
//         // ChildRoute(AppRoute.cardConfirmation.name,
//         //     child: (context, args) => const CreationCardConfirmationPage()),
//         RedirectRoute('/redirect', to: '/home')
//       ];
// }

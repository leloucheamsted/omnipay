import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omnipay/modules/card/presentation/pages/my_cards.page.dart';
import 'package:omnipay/modules/common/constants/font_family_constants.dart';
import 'package:omnipay/modules/common/constants/font_size_contants.dart';
import 'package:omnipay/modules/common/constants/icons_constants.dart';
import 'package:omnipay/modules/common/constants/palette_color.dart';
import 'package:omnipay/modules/common/widgets/typography/typo.widget.dart';
import 'package:omnipay/modules/home/presentation/pages/home.page.dart';
import 'package:omnipay/modules/navigation/bloc/nav_bloc.dart';
import 'package:omnipay/modules/settings/presentation/pages/settings.page.dart';
import 'package:omnipay/modules/transactions/presentation/pages/transactions.page.dart';
import 'package:provider/provider.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  final List<Widget> pages = const [
    HomePage(),
    MyCardsPage(),
    TransactionsPage(),
    SettingsPage(),
  ]; // to store nested
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: context.watch<NavBarProvider>().currentTab,
          children: pages,
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 19,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: PaletteColor.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75))
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _navigationItem(
                        IconsConstants.homeIcon, TabList.Home.name, 0),
                    _navigationItem(
                        IconsConstants.creditcardIcon, TabList.MyCards.name, 1),
                    _navigationItem(IconsConstants.activityIcon,
                        TabList.Transactions.name, 2),
                    _navigationItem(
                        IconsConstants.settingsIcon, TabList.Settings.name, 3),
                  ],
                ),
              )),
        ));
  }

  Widget _navigationItem(String icon, name, int tabIndex) {
    return InkWell(
      onTap: () {
        context.read<NavBarProvider>().changeTab(tabIndex);
      },
      child: Column(
        children: [
          SvgPicture.asset(
            height: 22,
            width: 22,
            icon,
            color: context.watch<NavBarProvider>().currentTab == tabIndex
                ? PaletteColor.primary
                : PaletteColor.grey,
          ),
          Text(
            name,
            style: TextStyle(
                fontFamily: FontsFamilyConstants.fontMedium,
                color: context.watch<NavBarProvider>().currentTab == tabIndex
                    ? PaletteColor.primary
                    : PaletteColor.grey,
                fontSize: FontsSizeConstants.bodytext1),
          )
        ],
      ),
    );
  }
}

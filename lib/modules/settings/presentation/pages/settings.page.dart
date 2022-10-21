import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/settings/presentation/bloc/settings_list.dart';
import 'package:omnipay/modules/settings/presentation/pages/ui/logout.dart';

import '../../../../routes/app_pages.dart';
import '../../../common/widget.dart';
import 'ui/settings_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.greyLight,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: LayoutConstants.appBarSize,
          flexibleSpace: AppBarRightButton(
            //color: PaletteColor.white,
            title: 'Settings', rigthWidget: _rightChild(),
            rightEvent: () {},
          )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero,
            LayoutConstants.paddingM,
            LayoutConstants.paddingM),
        child: Column(
          children: [
            const SizedBox(
              height: LayoutConstants.spaceXL,
            ),
            Expanded(
              child: MediaQuery.removeViewPadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  //controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    ///  called from the element component of the list
                    ///  parameters: {name_of_contry,dial_code,code}
                    return GestureDetector(
                      onTap: (() => _goItem(settingsList[index])),
                      child: SettingsItem(settingsEntity: settingsList[index]),
                    );
                  },
                  itemCount: settingsList.isEmpty ? 0 : settingsList.length,
                ),
              ),
            ),
            const Logout()
          ],
        ),
      ),
    );
  }

  void _goItem(SettingsEntity item) {
    if (item.title == "My Profile") {
      Get.toNamed(Routes.EDITPROFILE);
    }
  }

  Widget _rightChild() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: LayoutConstants.paddingS),
      child: Row(
        children: [
          SvgPicture.asset(IconsConstants.helpcircleIcon,
              color: PaletteColor.dark),
          const SizedBox(
            width: LayoutConstants.spaceS,
          ),
          const SubTitle4(content: 'Help', color: PaletteColor.hinner),
        ],
      ),
    );
  }
}

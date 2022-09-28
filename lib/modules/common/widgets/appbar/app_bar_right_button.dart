import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/constants/constants.dart';

import '../../widget.dart';

class AppBarRightButton extends StatelessWidget {
  final String title, rightBtnText;
  final VoidCallback rightEvent;
  const AppBarRightButton(
      {super.key,
      required this.rightEvent,
      required this.title,
      required this.rightBtnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: LayoutConstants.appBarSize * 2,
      color: PaletteColor.greyLight,
      child: _contentAppBar(),
    );
  }

  Widget _contentAppBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          LayoutConstants.paddingM,
          LayoutConstants.paddingM,
          LayoutConstants.paddingM,
          LayoutConstants.paddingS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Title2(content: title, color: PaletteColor.dark),
          _helpRightButton()
        ],
      ),
    );
  }

  Widget _helpRightButton() {
    return InkWell(
      onTap: rightEvent,
      child: Container(
        alignment: Alignment.center,
        width: 66,
        height: 30,
        decoration: BoxDecoration(
            color: PaletteColor.white,
            borderRadius: BorderRadius.circular(LayoutConstants.radiusM),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.white12,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ]),
        child: Title3(content: rightBtnText, color: PaletteColor.hinner),
      ),
    );
  }
}

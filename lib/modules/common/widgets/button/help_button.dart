import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widgets/button/ihelp_button.dart';

class HelpButton extends StatelessWidget {
  final VoidCallback event;
  const HelpButton({super.key, required this.event});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
        splashColor: PaletteColor.primaryLight.withOpacity(0.1),
        onTap: event,
        child: Ink(
          decoration: BoxDecoration(
              color: PaletteColor.greyLight,
              borderRadius: BorderRadius.circular(LayoutConstants.radiusS)),
          child: IHelpButton(
            widget: Text(
              'Need Help ?',
              style: TextStyle(
                color: PaletteColor.hinner,
                fontFamily: FontsFamilyConstants.fontRegular,
                fontWeight: FontWeight.w400,
                fontSize: FontsSizeConstants.title3,
              ),
            ),
          ),
        ));
  }
}

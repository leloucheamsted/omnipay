import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widgets/button/icontinue_button.dart';
import 'package:omnipay/modules/common/widgets/button/ihelp_button.dart';

class ActiveNotifButton extends StatefulWidget {
  final VoidCallback event;
  final Widget widget;
  const ActiveNotifButton(
      {super.key, required this.event, required this.widget});

  @override
  State<ActiveNotifButton> createState() => _ActiveNotifButtonState();
}

class _ActiveNotifButtonState extends State<ActiveNotifButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);

    controller.repeat(
        min: 0.0, max: 1.0, period: const Duration(milliseconds: 12));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
        splashColor: PaletteColor.white,
        hoverColor: PaletteColor.white,
        onTap: widget.event,
        child: Ink(
            decoration: BoxDecoration(
                color: PaletteColor.primary,
                borderRadius: BorderRadius.circular(LayoutConstants.radiusS)),
            child: IContinueButton(
              widget:
                  //;
                  Text(
                'Activate push notifications.',
                style: TextStyle(
                  color: PaletteColor.white,
                  fontFamily: FontsFamilyConstants.fontRegular,
                  fontWeight: FontWeight.w400,
                  fontSize: FontsSizeConstants.title3,
                ),
              ),
            )));
  }
}
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widgets/button/iclose_button.dart';
import 'package:omnipay/modules/common/widgets/button/icontinue_button.dart';

class ClosesButton extends StatefulWidget {
  final VoidCallback event;
  final Widget widget;
  const ClosesButton({super.key, required this.event, required this.widget});

  @override
  State<ClosesButton> createState() => _ClosesButtonState();
}

class _ClosesButtonState extends State<ClosesButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
        splashColor: PaletteColor.white,
        hoverColor: PaletteColor.white,
        onTap: () {
          print("l");
          Get.offAllNamed('/home');
        },
        child: Ink(
            decoration: BoxDecoration(
                color: PaletteColor.primary,
                borderRadius: BorderRadius.circular(LayoutConstants.radiusS)),
            child: ICloseButton(
              widget:
                  //;
                  Text(
                'Close',
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widgets/button/icontinue_button.dart';
import 'package:omnipay/modules/common/widgets/button/ihelp_button.dart';

class ContinuButton extends StatelessWidget {
  final VoidCallback event;
  final Widget widget;
  const ContinuButton({super.key, required this.event, required this.widget});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: event,
        child: IContinueButton(
          widget: Text(
            'Continue',
            style: TextStyle(
              color: PaletteColor.white,
              fontFamily: FontsFamilyConstants.fontRegular,
              fontWeight: FontWeight.w400,
              fontSize: FontsSizeConstants.title3,
            ),
          ),
        ));
  }
}

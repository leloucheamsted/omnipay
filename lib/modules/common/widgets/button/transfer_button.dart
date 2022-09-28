import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widgets/button/ihelp_button.dart';

class TransferButton extends StatelessWidget {
  final VoidCallback event;
  const TransferButton({super.key, required this.event});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: event,
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
        ));
  }
}

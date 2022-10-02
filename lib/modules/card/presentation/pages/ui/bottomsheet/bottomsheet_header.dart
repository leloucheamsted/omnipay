import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnipay/modules/common/constants/icons_constants.dart';
import 'package:omnipay/modules/common/constants/palette_color.dart';
import 'package:omnipay/modules/common/widget.dart';

import '../../../../../common/constants/constants.dart';

class BottomSheetHeader extends StatelessWidget {
  final VoidCallback onClose;
  final String title;
  const BottomSheetHeader(
      {super.key, required this.onClose, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Title3(content: title, color: PaletteColor.dark), _closeBtn()],
    );
  }

  Widget _closeBtn() {
    return InkWell(
      onTap: onClose,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: PaletteColor.greyLight,
            borderRadius: BorderRadius.circular(15)),
        height: 30,
        width: 30,
        child: SvgPicture.asset(IconsConstants.closeIcon),
      ),
    );
  }
}

import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/constants/layout_constants.dart';
import 'package:omnipay/modules/common/widget.dart';

class TextAppBar extends StatelessWidget {
  final String title;
  final Color color;
  const TextAppBar({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: LayoutConstants.appBarSize * 2,
      color: color,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingM,
            LayoutConstants.paddingM,
            LayoutConstants.paddingS),
        child: Title2(content: title, color: PaletteColor.dark),
      ),
    );
  }
}

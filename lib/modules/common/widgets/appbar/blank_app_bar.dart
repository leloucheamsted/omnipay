import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/constants/layout_constants.dart';

import '../../constants/constants.dart';

class BlanckAppBar extends StatelessWidget {
  const BlanckAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: LayoutConstants.appBarSize,
      color: PaletteColor.greyLight,
    );
  }
}

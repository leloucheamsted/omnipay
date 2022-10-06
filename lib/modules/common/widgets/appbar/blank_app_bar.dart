// ignore: implementation_imports
import 'package:flutter/src/widgets/container.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

import '../../constants/constants.dart';

class BlanckAppBar extends StatelessWidget {
  const BlanckAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: LayoutConstants.appBarSize * 2,
      color: PaletteColor.greyLight,
    );
  }
}

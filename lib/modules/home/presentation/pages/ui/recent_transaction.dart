import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omnipay/modules/common/constants/palette_color.dart';
import 'package:omnipay/modules/common/widgets/typography/typo.widget.dart';

import '../../../../common/constants/constants.dart';

class Recenttansaction extends StatelessWidget {
  const Recenttansaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BodyText1(content: 'Transactions', color: PaletteColor.dark),
            GestureDetector(
                child: const BodyText1(
                    content: 'See All', color: PaletteColor.primary)),
          ],
        ),
        Expanded(
          child: SizedBox(
            child: _notItem(),
          ),
        )
      ],
    );
  }

  Widget _notItem() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            IconsConstants.clockIcon,
            color: PaletteColor.greyDark,
          ),
          const SubTitle2(
              content: 'There are currently no transactions.',
              color: PaletteColor.greyDark),
        ],
      ),
    );
  }
}

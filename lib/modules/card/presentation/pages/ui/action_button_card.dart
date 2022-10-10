import 'package:flutter/material.dart';
import 'package:omnipay/modules/card/presentation/pages/ui/reload_widget.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widgets/button/icon_custom_button.dart';
import 'package:provider/provider.dart';

import '../../../bloc/cards_bloc.dart';

class ActionButtonCard extends StatelessWidget {
  const ActionButtonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconCustomButton(
            onTap: () {
              _relaodSheet(context);
            },
            width: (MediaQuery.of(context).size.width - 52) / 2,
            content: 'Reload',
            icon: IconsConstants.plusIcon,
            background: PaletteColor.primaryLight.withOpacity(0.1),
            textColor: PaletteColor.primary),
        IconCustomButton(
            onTap: () {
              blockEvent(context);
            },
            width: (MediaQuery.of(context).size.width - 32) / 2,
            content: 'Block',
            icon: IconsConstants.eyeIcon,
            background: PaletteColor.primaryLight.withOpacity(0.1),
            textColor: PaletteColor.primary),
      ],
    );
  }

  void _relaodSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Form(key: key, child: const ReloadWidget());
        });
  }

  void blockEvent(context) {
    Provider.of<CardsBloc>(context, listen: false).changeBlockStatut(context);
  }
}

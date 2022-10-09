import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnipay/modules/card/bloc/cards_bloc.dart';
import 'package:omnipay/modules/common/widget.dart';
import 'package:blur/blur.dart';
import 'package:provider/provider.dart';

import '../../../../common/constants/constants.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: PaletteColor.primary,
            borderRadius: BorderRadius.circular(LayoutConstants.radiusM),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: PaletteColor.primary.withOpacity(0.4),
                  blurRadius: 30.0,
                  offset: const Offset(0.0, 0.75))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(
            LayoutConstants.paddingM,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _amountWidget(context),
              const SizedBox(
                height: 40,
              ),
              _infoWidget(context),
              const SizedBox(
                height: 40,
              ),
              _footerWidget(context),
            ],
          ),
        ));
  }

  Widget _amountWidget(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // amount

        Blur(
          colorOpacity: 0,
          blur: Provider.of<CardsBloc>(context, listen: true).isBlock == true
              ? 5
              : 0,
          blurColor: Theme.of(context).primaryColor,
          child: Row(
            children: const [
              SubTitle4(content: 'FCFA', color: PaletteColor.white),
              SizedBox(
                width: LayoutConstants.spaceS,
              ),
              SubTitle4(content: '20,000', color: PaletteColor.white)
            ],
          ),
        ),
        SvgPicture.asset(IconsConstants.paymate),
      ],
    );
  }

  Widget _infoWidget(context) {
    return Blur(
      colorOpacity: 0,
      blur:
          Provider.of<CardsBloc>(context, listen: true).isBlock == true ? 5 : 0,
      blurColor: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SubTitle4(
              content: '1234  5678  9012  3456', color: PaletteColor.white),
          SizedBox(
            height: LayoutConstants.spaceS,
          ),
          SubTitle1(content: 'EXP  01/22', color: PaletteColor.white)
        ],
      ),
    );
  }

  Widget _footerWidget(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //  name
        Blur(
            colorOpacity: 0,
            blur: Provider.of<CardsBloc>(context, listen: true).isBlock == true
                ? 5
                : 0,
            blurColor: Theme.of(context).primaryColor,
            child: const SubTitle4(
                content: 'Jeremy Smith', color: PaletteColor.white)),
        SvgPicture.asset(IconsConstants.cardIcon),
      ],
    );
  }
}

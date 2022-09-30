import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omnipay/modules/common/widgets/typography/typo.widget.dart';

import '../../../common/constants/constants.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardDetails(),
          const SizedBox(
            height: LayoutConstants.spaceM,
          ),
          _buildingAddress()
        ]);
  }

  Widget _cardDetails() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: PaletteColor.white,
          borderRadius: BorderRadius.circular(LayoutConstants.radiusM),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.white10,
                blurRadius: 30.0,
                offset: Offset(0.0, 0.75))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(
          LayoutConstants.paddingM,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Card details',
                textAlign: TextAlign.start,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: TextStyle(
                  color: PaletteColor.dark,
                  fontFamily: FontsFamilyConstants.fontMedium,
                  fontWeight: FontWeight.w400,
                  fontSize: FontsSizeConstants.subtitle1,
                ),
              ),
              _itemList('Card name', 'Jeremy Smith', true),
              const Divider(
                thickness: 1,
                color: PaletteColor.grey,
              ),
              _itemList('Card number', '1234 5678 9012 3456', true),
              const Divider(
                thickness: 1,
                color: PaletteColor.grey,
              ),
              _itemList('Valid till', '01/22', false),
              const Divider(
                thickness: 1,
                color: PaletteColor.grey,
              ),
              _itemList('Card type', 'Virtual', false),
            ]),
      ),
    );
  }

  Widget _buildingAddress() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: PaletteColor.white,
          borderRadius: BorderRadius.circular(LayoutConstants.radiusM),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.white10,
                blurRadius: 30.0,
                offset: Offset(0.0, 0.75))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(
          LayoutConstants.paddingM,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Billing Address',
                textAlign: TextAlign.start,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: TextStyle(
                  color: PaletteColor.dark,
                  fontFamily: FontsFamilyConstants.fontMedium,
                  fontWeight: FontWeight.w400,
                  fontSize: FontsSizeConstants.subtitle1,
                ),
              ),
              _itemList('Address', '471 mundet pl', true),
              const Divider(
                thickness: 1,
                color: PaletteColor.grey,
              ),
              _itemList('City/Region', 'Hillside, new jersey', true),
              const Divider(
                thickness: 1,
                color: PaletteColor.grey,
              ),
              _itemList('Zip code', '07295', true),
            ]),
      ),
    );
  }

  Widget _itemList(String title, info, bool copy) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: LayoutConstants.spaceL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SubTitle1(content: title, color: PaletteColor.greyDark),
          Row(
            children: [
              SubTitle1(content: info, color: PaletteColor.dark),
              SizedBox(
                child: copy == true
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(
                            LayoutConstants.paddingS,
                            LayoutConstants.paddingZero,
                            LayoutConstants.paddingZero,
                            LayoutConstants.paddingZero),
                        child: InkWell(
                          onTap: (() {}),
                          child: SvgPicture.asset(
                            IconsConstants.copyIcon,
                            color: PaletteColor.primary,
                          ),
                        ),
                      )
                    : null,
              )
            ],
          )
        ],
      ),
    );
  }
}

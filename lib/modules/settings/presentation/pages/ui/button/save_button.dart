import 'package:flutter/material.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widgets/button/icontinue_button.dart';
import 'package:omnipay/modules/users/presentation/auth/bloc/auth_bloc.dart';
import 'package:provider/provider.dart';

class SaveButton extends StatefulWidget {
  final VoidCallback event;
  const SaveButton({super.key, required this.event});

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
        splashColor: PaletteColor.white,
        //hoverColor: PaletteColor.white,
        onTap: widget.event,
        child: Ink(
            decoration: BoxDecoration(
                color: PaletteColor.primary,
                borderRadius: BorderRadius.circular(LayoutConstants.radiusS)),
            child: IContinueButton(
              widget: Text(
                'Save',
                style: TextStyle(
                  color: PaletteColor.white,
                  fontFamily: FontsFamilyConstants.fontRegular,
                  fontWeight: FontWeight.w400,
                  fontSize: FontsSizeConstants.title3,
                ),
              ),
            )));
  }
}

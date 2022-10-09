import 'package:flutter/material.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widgets/button/icontinue_button.dart';
import 'package:omnipay/modules/users/presentation/auth/bloc/auth_bloc.dart';
import 'package:provider/provider.dart';

class ContinuButton extends StatefulWidget {
  final VoidCallback event;
  final Widget widget;
  const ContinuButton({super.key, required this.event, required this.widget});

  @override
  State<ContinuButton> createState() => _ContinuButtonState();
}

class _ContinuButtonState extends State<ContinuButton> {
  bool isLoading = false;

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
              widget:
                  //;
                  context.watch<AuthBloc>().isLoading == true
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1.5,
                          ))
                      : Text(
                          'Continue',
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

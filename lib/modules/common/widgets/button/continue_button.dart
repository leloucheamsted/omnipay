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

class _ContinuButtonState extends State<ContinuButton>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);

    controller.repeat(
        min: 0.0, max: 1.0, period: const Duration(milliseconds: 12));
  }

  @override
  void dispose() {
    controller.dispose();
    //context.read<AuthBloc>().showLoadingAnimation();
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

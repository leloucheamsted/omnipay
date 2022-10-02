import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widget.dart';

class TextFielContainer extends StatefulWidget {
  final double? width;
  final bool showchild;
  final String errorMessage;
  final Alignment alignment;
  final TypeInfo typeInfo;
  final Widget infoWidget;
  final Widget child;
  final Widget? messageWidget;
  const TextFielContainer({
    super.key,
    this.width,
    required this.showchild,
    required this.errorMessage,
    required this.alignment,
    required this.child,
    required this.typeInfo,
    required this.infoWidget,
    this.messageWidget,
  });

  @override
  State<TextFielContainer> createState() => _TextFielContainerState();
}

class _TextFielContainerState extends State<TextFielContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: LayoutConstants.btnHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color:
                  widget.showchild == false || widget.typeInfo != TypeInfo.error
                      ? PaletteColor.grey
                      : PaletteColor.danger,
            ),
            borderRadius: BorderRadius.circular(LayoutConstants.radiusS),
          ),
          child: widget.child,
        ),
        const SizedBox(
          height: LayoutConstants.spaceS,
        ),
        SizedBox(
          child: widget.messageWidget != null && widget.showchild == false
              ? widget.messageWidget
              : null,
        ),
        SizedBox(child: widget.showchild == true ? widget.infoWidget : null)
      ],
    );
  }
}

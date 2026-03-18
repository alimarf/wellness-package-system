import '../../../../utils/size/button_size.dart';
import 'package:flutter/material.dart';

import 'a_primary_button.dart';

// ignore: must_be_immutable
class AGhostButton extends StatelessWidget {
  String? text;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color? color;
  Color? borderColor;
  Color? backgroundColor;
  double? elevation;
  double? height;
  double? width;
  double? borderRadius;
  Function? onClick;
  bool? isLoading;
  ButtonSize? size;

  AGhostButton(
      {Key? key,
      this.text,
      this.suffixIcon,
      this.prefixIcon,
      this.color,
      this.borderColor,
      this.backgroundColor,
      this.elevation = 0,
      this.height,
      this.width,
      this.borderRadius = 8,
      this.onClick,
      this.isLoading = false,
      this.size = ButtonSize.Medium})
      : super(key: key) {
    backgroundColor = backgroundColor ?? Colors.transparent;
    borderColor = borderColor ?? Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return APrimaryButton(
      text: text,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      color: color,
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      elevation: elevation,
      height: height,
      width: width,
      borderRadius: borderRadius,
      onClick: onClick,
      size: size,
      enableEffect: false,
    );
  }
}

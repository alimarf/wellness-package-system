import '../../../../utils/size/button_size.dart';
import '../../../colors/colors.dart';
import 'package:flutter/material.dart';

import 'a_primary_button.dart';

// ignore: must_be_immutable
class APlainButton extends StatelessWidget {
  String text;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color? color;
  Color? borderColor;
  Color? backgroundColor;
  double? elevation;
  double? height;
  double? width;
  double? borderRadius;
  VoidCallback onClick;
  bool? isLoading;
  bool? isDisabled;
  ButtonSize? size;

  APlainButton(
      {Key? key,
      required this.text,
      this.suffixIcon,
      this.prefixIcon,
      this.color,
      this.borderColor,
      this.backgroundColor,
      this.elevation = 0,
      this.height = 42,
      this.width,
      this.borderRadius = 8,
      required this.onClick,
      this.isLoading = false,
      this.isDisabled = false,
      this.size = ButtonSize.Medium})
      : super(key: key) {
    borderColor = borderColor ?? AppColors.plainButtonColor;
    backgroundColor = backgroundColor ?? AppColors.plainButtonColor;
    color = AppColors.textPlainButton;
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
      isLoading: isLoading,
      isDisabled: isDisabled,
      size: size,
    );
  }
}

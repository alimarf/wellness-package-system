import 'package:flutter/material.dart';
import '../../../../utils/size/button_size.dart';
import '../../../colors/colors.dart';
import 'a_primary_button.dart';

// ignore: must_be_immutable
class ACircleButton extends StatelessWidget {
  Widget? icon;
  Color? color;
  Color? borderColor;
  Color? backgroundColor;
  double diameters;
  VoidCallback onClick;
  bool? isLoading;
  bool? isDisabled;
  ButtonSize? size;

  ACircleButton(
      {Key? key,
      this.icon,
      this.color = Colors.white,
      this.borderColor = Colors.white,
      this.backgroundColor,
      this.diameters = 40,
      required this.onClick,
      this.isLoading = false,
      this.isDisabled = false,
      this.size = ButtonSize.Medium})
      : super(key: key) {
    backgroundColor = backgroundColor ?? AppColors.primary;
    borderColor = borderColor ?? AppColors.white;
    color = color ?? AppColors.white;
  }

  @override
  Widget build(BuildContext context) {
    return APrimaryButton(
      prefixIcon: icon,
      color: color,
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      height: diameters,
      width: diameters,
      borderRadius: diameters,
      isCircle: true,
      isLoading: isLoading,
      isDisabled: isDisabled,
      onClick: onClick,
      size: size,
    );
  }
}

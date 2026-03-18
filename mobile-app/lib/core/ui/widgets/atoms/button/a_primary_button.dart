import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/size/button_size.dart';
import '../../../colors/colors.dart';
import '../gap/a_gap.dart';

// ignore: must_be_immutable
class APrimaryButton extends StatelessWidget {
  String? text;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color? color;
  Color? borderColor;
  Color? backgroundColor;
  Color? pressedBackgroundColor;
  TextStyle? textStyle;
  double? height;
  double? width;
  double? elevation;
  double? borderSize;
  double? borderRadius;
  bool? enableEffect;
  bool? isCircle;
  Function? onClick;
  bool? isDisabled;
  bool? isLoading;
  ButtonSize? size;

  APrimaryButton(
      {Key? key,
      this.text,
      this.prefixIcon,
      this.suffixIcon,
      this.color = AppColors.white,
      this.borderColor,
      this.backgroundColor,
      this.pressedBackgroundColor = AppColors.grayLight,
      this.textStyle,
      this.height,
      this.width,
      this.elevation = 2,
      this.borderSize = 1,
      this.borderRadius,
      this.enableEffect = false,
      this.isCircle = false,
      required this.onClick,
      this.isDisabled = false,
      this.isLoading = false,
      this.size = ButtonSize.Medium})
      : super(key: key) {
    borderRadius = borderRadius ?? 20;
    borderColor = borderColor ?? AppColors.primary.shade400;
    backgroundColor = backgroundColor ?? AppColors.primary.shade800;
  }

  TextStyle _getTextStyle() {
    if (textStyle != null) {
      return textStyle!;
    } else {
      switch (size) {
        case ButtonSize.Medium:
          return Theme.of(Get.context!)
              .textTheme
              .bodyLarge!
              .copyWith(color: color);
        case ButtonSize.Small:
          return Theme.of(Get.context!)
              .textTheme
              .bodyMedium!
              .copyWith(color: color);
        default:
          return Theme.of(Get.context!)
              .textTheme
              .bodyLarge!
              .copyWith(color: color);
      }
    }
  }

  double _getHeight() {
    if (height != null) {
      return height!.toDouble();
    }

    switch (size) {
      case ButtonSize.Medium:
        return 42.0;
      case ButtonSize.Small:
        return 30.0;
      default:
        return 42.0;
    }
  }

  double _getWidth() {
    if (width != null) {
      return width!.toDouble();
    }

    double? calculatedWidth = (text?.length ?? 1) * 15;

    return calculatedWidth;
  }

  Widget _buildContent() {
    List<Widget> content = [];
    if (isLoading == true) {
      content.add(SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(color),
          backgroundColor: backgroundColor,
          strokeWidth: 3,
        ),
      ));
      content.add(AGap(
        width: 10,
      ));
    }

    if (prefixIcon != null) {
      content.add(prefixIcon!);
      if (text != null && prefixIcon != null) {
        content.add(const SizedBox(
          width: 10,
        ));
      }
    }

    if (text != null) {
      content.add(Text(text!, style: _getTextStyle()));
    }

    if (suffixIcon != null) {
      content.add(const SizedBox(
        width: 10,
      ));
      content.add(suffixIcon!);
    }

    if ((prefixIcon != null && suffixIcon == null) && text != null) {
      content.add(const SizedBox(
        width: 10,
      ));
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: content);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _getHeight(),
      width: _getWidth(),
      child: ElevatedButton(
        onPressed:
            isDisabled != true && onClick != null ? () => onClick!() : null,
        child: _buildContent(),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor,
          disabledBackgroundColor: AppColors.black.shade200,
          elevation: elevation,
          splashFactory:
              enableEffect == true ? InkRipple.splashFactory : NoSplash.splashFactory,
          side: BorderSide(
              color:
                  isDisabled == true ? AppColors.gray.shade100 : borderColor!,
              width: borderSize ?? 0),
          shape: isCircle == true
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius!)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/size/tag_size.dart';
import '../../../colors/colors.dart';
import '../../../typography/typography.dart';

// ignore: must_be_immutable
class ATag extends StatelessWidget {
  String? text;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color? color;
  Color? borderColor;
  Color? backgroundColor;
  Color? selectedBackgroundColor;
  TextStyle? textStyle;
  double? height;
  double? width;
  double? elevation;
  double? borderSize;
  double? borderRadius;
  bool? enableEffect;
  bool? isCircle;
  VoidCallback onClick;
  bool? isLoading;
  TagSize? size;
  bool? isSelected;

  ATag(
      {Key? key,
      this.text,
      this.prefixIcon,
      this.suffixIcon,
      this.color,
      this.borderColor,
      this.backgroundColor,
      this.selectedBackgroundColor = AppColors.primaryDark,
      this.textStyle,
      this.height = 24,
      this.width,
      this.elevation = 0,
      this.borderSize = 1,
      this.borderRadius = 8,
      this.enableEffect = false,
      this.isCircle = false,
      required this.onClick,
      this.isLoading = false,
      this.size = TagSize.Large,
      this.isSelected = false})
      : super(key: key) {
    // color = color ?? AppColors.secondaryTextColor;
    // borderColor = borderColor ?? AppColors.tagColor;
    // backgroundColor = backgroundColor ?? AppColors.tagColor;
  }

  TextStyle _getTextStyle() {
    if (textStyle != null) {
      return textStyle!;
    } else {
      switch (size) {
        case TagSize.Large:
          if (Get.isDarkMode) {
            return AppTypography.darkTextTheme.bodySmall!
                .copyWith(fontSize: 16, color: color);
          } else {
            return AppTypography.lightTextTheme.bodySmall!
                .copyWith(fontSize: 16, color: color);
          }
        case TagSize.Medium:
          if (Get.isDarkMode) {
            return AppTypography.darkTextTheme.bodySmall!
                .copyWith(fontSize: 16, color: color);
          } else {
            return AppTypography.lightTextTheme.bodySmall!
                .copyWith(fontSize: 16, color: color);
          }
        default:
          if (Get.isDarkMode) {
            return AppTypography.darkTextTheme.bodySmall!
                .copyWith(fontSize: 16, color: color);
          } else {
            return AppTypography.lightTextTheme.bodySmall!
                .copyWith(fontSize: 16, color: color);
          }
      }
    }
  }

  double _getHeight() {
    switch (size) {
      case TagSize.Large:
        return 24.0;
      case TagSize.Medium:
        return 20.0;
      default:
        return 24.0;
    }
  }

  Color _getBackgroundColor() {
    if (isSelected == true) {
      return selectedBackgroundColor!;
    } else {
      return backgroundColor!;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> content = [];
    if (isLoading == true) {
      content.add(CircularProgressIndicator(
        valueColor: const AlwaysStoppedAnimation(Colors.white),
        backgroundColor: backgroundColor,
        strokeWidth: 3,
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

    return SizedBox(
      height: _getHeight(),
      child: ElevatedButton(
        onPressed: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: content,
        ),
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: _getBackgroundColor(),
          splashFactory:
              enableEffect! ? InkRipple.splashFactory : NoSplash.splashFactory,
          side: BorderSide(color: borderColor!, width: borderSize!),
          fixedSize: Size(width != null ? width! : Get.size.width, height!),
          shape: isCircle!
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius!)),
        ),
      ),
    );
  }
}

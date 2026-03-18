// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../colors/colors.dart';

class ACard extends StatelessWidget {
  Widget child;
  Color? backgroundColor;
  Color? borderColor;
  double borderWidth;
  bool showShadow;
  double? height;
  double? width;
  EdgeInsets? padding;
  double? borderRadius;
  Function? onClick;

  ACard(
      {Key? key,
      required this.child,
      this.backgroundColor,
      this.borderColor,
      this.borderWidth = 1,
      this.borderRadius = 6,
      this.showShadow = false,
      this.height,
      this.width,
      this.padding = EdgeInsets.zero,
      this.onClick})
      : super(key: key) {
    borderColor = borderColor ?? Colors.black12;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick != null ? () => onClick!() : null,
      child: Container(
          height: height,
          width: width ?? MediaQuery.of(context).size.width,
          padding: padding,
          decoration: BoxDecoration(
              color: backgroundColor ?? (Get.isDarkMode ? AppColors.black.shade600 : AppColors.white),
              border: Border.all(color: borderColor!, width: borderWidth),
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
              boxShadow: showShadow
                  ? [
                      BoxShadow(
                          color: AppColors.gray.withOpacity(0.1),
                          blurRadius: 5.0,
                          spreadRadius: 0,
                          offset: const Offset(
                            0.0,
                            0.0,
                          ),
                        )
                    ]
                  : []),
          child: child),
    );
  }
}

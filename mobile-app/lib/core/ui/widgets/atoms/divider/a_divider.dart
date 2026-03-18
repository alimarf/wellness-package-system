// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../colors/colors.dart';
import '../container/a_container.dart';

enum DividerDirection { horizontal, vertical }

class ADivider extends StatelessWidget {
  Color? color;
  double? width;
  EdgeInsets? margin;
  DividerDirection? direction;

  ADivider(
      {Key? key,
      this.direction = DividerDirection.horizontal,
      this.width = 1,
      this.color,
      this.margin = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AContainer(
      height: direction == DividerDirection.horizontal ? width : context.height,
      width: direction == DividerDirection.horizontal ? context.width : width,
      margin: margin,
      color: color ?? (Get.isDarkMode ? AppColors.black.shade300 : AppColors.dividerColor),
    );
  }
}

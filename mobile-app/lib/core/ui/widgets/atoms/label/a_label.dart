// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

enum Status { Success, Info, Warning, Danger, Muted, Secondary }

// ignore: must_be_immutable
class ALabel extends StatelessWidget {
  String description;
  Status? status;
  Color? textColor;
  Color? backgroundColor;
  Color? borderColor;
  TextAlign? textAlign;

  ALabel(
      {Key? key,
      required this.description,
      this.status,
      this.textColor,
      this.backgroundColor,
      this.textAlign,
      this.borderColor})
      : super(key: key);

  Color getBackgroundColor() {
    switch (status) {
      case Status.Info:
        return AppColors.infoColor.shade100.withOpacity(0.3);
      case Status.Success:
        return AppColors.success.shade100.withOpacity(0.3);
      case Status.Warning:
        return AppColors.warning.shade100.withOpacity(0.3);
      case Status.Danger:
        return AppColors.error.shade100.withOpacity(0.3);
      case Status.Muted:
        return AppColors.gray.shade300.withOpacity(0.3);
      default:
        return AppColors.error.shade100.withOpacity(0.3);
    }
  }

  Color getTextColor() {
    switch (status) {
      case Status.Info:
        return AppColors.infoColor.shade700;
      case Status.Success:
        return AppColors.success.shade500;
       case Status.Warning:
        return AppColors.warning.shade500;
      case Status.Danger:
        return AppColors.error.shade500;
      case Status.Muted:
        return AppColors.gray.shade500;
      default:
        return AppColors.error.shade500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
          color: backgroundColor ?? getBackgroundColor(),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1, color: (borderColor ?? getBackgroundColor()))),
      child: Text(
        description,
        textAlign: textAlign ?? TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: textColor ?? getTextColor()),
      ),
    );
  }
}

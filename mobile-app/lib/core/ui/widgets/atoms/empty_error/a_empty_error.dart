// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../colors/colors.dart';
import '../../../constants/sizes.dart';
import '../button/a_primary_button.dart';
import '../gap/a_gap.dart';

class AEmptyError extends StatelessWidget {
  Widget? icon;
  String? title;
  String? description;
  Function? onRetry;

  AEmptyError({Key? key, this.icon, this.description, this.title, this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            icon!
          else
            Icon(
              Icons.info_outline,
              size: 120,
              color: Get.isDarkMode ? AppColors.white : AppColors.black,
            ),
          AGap(
            height: AppSizes.smallMargin,
          ),
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            description ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Get.isDarkMode ? AppColors.white :  AppColors.gray.shade600),
          ),
          AGap(
            height: AppSizes.margin,
          ),
          if (onRetry != null)
            APrimaryButton(
              text: 'Muat ulang'.tr,
              onClick: () => onRetry!(),
              width: 60.w,
            )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../ui/colors/colors.dart';
import '../../ui/widgets/atoms/button/a_primary_button.dart';

class AppDialog {
   static showSuccess({required String message, String? actionLabel, Function? onActionClicked}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                LucideIcons.checkCircle,
                color: AppColors.gray.shade800,
                size: 60,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Get.context!.textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  color: AppColors.gray.shade800,
                ),
              ),
              const SizedBox(height: 24),
              APrimaryButton(
                text: actionLabel ?? 'Closed'.tr,
                onClick: onActionClicked ?? () {
                  Get.back();
                },
              )
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  static showInfo({required String message, String? actionLabel, Function? onActionClicked}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.info_outline,
                color: AppColors.gray.shade800,
                size: 60,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Get.context!.textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  color: AppColors.gray.shade800,
                ),
              ),
              const SizedBox(height: 24),
              APrimaryButton(
                text: actionLabel ?? 'Closed'.tr,
                onClick: onActionClicked ?? () {
                  Get.back();
                },
              )
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}

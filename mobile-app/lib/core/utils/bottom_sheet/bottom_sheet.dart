import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../ui/colors/colors.dart';
import '../../ui/widgets/atoms/button/a_primary_button.dart';

class AppBottomSheet {
  static showSuccess(
      {required String message,
      String? actionLabel,
      bool? isDismissible,
      Function? onActionClicked}) {
    showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        isDismissible: isDismissible ?? true,
        backgroundColor: Colors.transparent,
        builder: (_) => Container(
              color: Get.isDarkMode ? AppColors.black : AppColors.white,
              width: Get.context!.width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LucideIcons.checkCircle,
                      color: Get.isDarkMode
                          ? AppColors.white
                          : AppColors.gray.shade800,
                      size: 60,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Get.context!.textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        color: Get.isDarkMode
                            ? AppColors.white
                            : AppColors.gray.shade800,
                      ),
                    ),
                    const SizedBox(height: 24),
                    APrimaryButton(
                      text: actionLabel ?? 'Ok'.tr,
                      width: Get.context!.width,
                      onClick: onActionClicked ??
                          () {
                            Get.back();
                          },
                    )
                  ],
                ),
              ),
            ));
  }

  static showInfo(
      {required String message,
      String? actionLabel,
      Function? onActionClicked}) {
    showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        builder: (_) => Container(
              color: Get.isDarkMode ? AppColors.black : AppColors.white,
              width: Get.context!.width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Get.isDarkMode
                          ? AppColors.white
                          : AppColors.gray.shade800,
                      size: 60,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Get.context!.textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        color: Get.isDarkMode
                            ? AppColors.white
                            : AppColors.gray.shade800,
                      ),
                    ),
                    const SizedBox(height: 24),
                    APrimaryButton(
                      text: actionLabel ?? 'Ok'.tr,
                      width: Get.context!.width,
                      onClick: onActionClicked ??
                          () {
                            Get.back();
                          },
                    )
                  ],
                ),
              ),
            ));
  }
}

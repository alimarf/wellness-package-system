import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/colors/colors.dart';

class AppToast {
  static showSuccess({required String message, Color? backgroundColor}) {
    backgroundColor = backgroundColor ?? AppColors.success;
    Get.rawSnackbar(backgroundColor: backgroundColor, message: message);
  }

  static showError({required String message, Color? backgroundColor}) {
    backgroundColor = backgroundColor ?? AppColors.error;
    Get.rawSnackbar(backgroundColor: backgroundColor, message: message);
  }

  static showInfo({required String message, Color? backgroundColor}) {
    backgroundColor = backgroundColor ?? AppColors.gray.shade800;
    Get.rawSnackbar(backgroundColor: backgroundColor, message: message);
  }
}

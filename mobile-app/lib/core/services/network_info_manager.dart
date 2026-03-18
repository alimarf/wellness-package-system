import 'dart:io';

import 'package:get/get.dart';

import '../config/app_config.dart';
import '../utils/toast/toast.dart';

class NetworkInfoManager {
  Future<bool> isConnected() async {
    bool isConnected = false;
    try {
      final result =
          await InternetAddress.lookup(AppConfig.instance.connectionCheckerUrl);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      if (!Get.isSnackbarOpen) {
        Get.closeAllSnackbars();
        AppToast.showInfo(message: 'Tidak ada koneksi internet'.tr);
      }
    }
    return isConnected;
  }
}

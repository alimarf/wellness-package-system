import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../../core/base/base_controller.dart';
import '../../../../../core/config/app_config.dart';
import '../../../../../core/services/auth_token_manager.dart';
import '../../../../../core/utils/log/logger.dart';
import '../../../../../core/utils/toast/toast.dart';

import '../../../package/routes/pages.dart';
import '../../utils/dark_mode_config_enum.dart';

class SplashController extends BaseController {
  final AuthTokenManager authTokenManager;

  final versionName = Rxn<String>();
  final buildNumber = Rxn<String>();

  final darkModeConfig = Rxn<String>();

  SplashController({
    required this.authTokenManager,
  });

  // goToLogin() => _goToLogin();
  // getApplicationVersion() => _getApplicationVersion();

  @override
  Future<void> onReady() async {
    super.onReady();

    // await fetchData();

    if (darkModeConfig.value == DarkModeConfigEnum.dark.name) {
      Get.changeThemeMode(ThemeMode.dark);
    } else if (darkModeConfig.value == DarkModeConfigEnum.light.name) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.system);
    }

    await Future.delayed(const Duration(seconds: 3));

    Get.offAllNamed(PackageRoutes.PACKAGES);
  }

  Future<void> fetchData() async {
    // await getApplicationVersion();
    // await getStoredDarkModeConfig();
  }

  Future<void> _getApplicationVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    versionName.value = packageInfo.version;
    buildNumber.value = packageInfo.buildNumber;
  }

  // Future<void> _getStoredDarkModeConfig() async {
  //   try {
  //     final result = await getDarkModeConfig.execute();

  //     result.fold((l) {
  //       if (l.data != null) darkModeConfig.value = l.data;
  //     }, (r) {
  //       if (r.data != null) darkModeConfig.value = r.data;
  //     });
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  void _goToLogin() {
    // Get.offAndToNamed(AuthRoutes.LOGIN);
  }
}

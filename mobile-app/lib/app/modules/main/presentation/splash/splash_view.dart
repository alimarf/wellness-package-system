import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/config/app_config.dart';
import '../../../../../core/ui/colors/colors.dart';
import '../../../../../core/values/flavor/flavor.dart';
import '../../../../../core/ui/widgets/organigrams/scaffold/o_scaffold.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  String get _flavorString {
    switch (AppConfig.instance.flavor) {
      case AppFlavor.dev:
        return 'DEV';
      case AppFlavor.staging:
        return 'STAGING';
      case AppFlavor.prod:
        return 'PROD';
      default:
        return AppConfig.instance.flavor.text.toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return OScaffold(
      showBackground: false,
      backgroundColor: AppColors.primaryLight,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.spa,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            Text(
              'Wellness - $_flavorString',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

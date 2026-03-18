
import 'package:alice/alice.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../core/config/app_config.dart';

import '../core/ui/themes/themes.dart';
import '../core/values/flavor/flavor.dart';
import 'routes/app_pages.dart';
import 'translations.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final AppConfig config = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: null,
      title: config.appName,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      getPages: AppPages.routes,
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      initialRoute: AppPages.INITIAL,
      builder: (context, widget) {
        return Stack(
          children: [
            MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget ?? const SizedBox()),
            // if (kDebugMode || (AppConfig.instance.flavor == AppFlavor.dev || AppConfig.instance.flavor == AppFlavor.staging))
            //   Positioned(
            //       bottom: AppSizes.margin,
            //       right: AppSizes.margin,
            //       child: Material(
            //         color: AppColors.transparent,
            //         child: InkWell(
            //           onTap: () {
            //             Get.toNamed(ToolsRoutes.TOOLS);
            //           },
            //           child: Icon(
            //             size: 40,
            //             LucideIcons.bug,
            //             color: AppColors.primary.withOpacity(0.6),
            //           ),
            //         ),
            //       ))
          ],
        );
      },
    );
  }
}

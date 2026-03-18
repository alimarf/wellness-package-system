import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/di.dart';
import 'package:mobile_app/app/initializer.dart';
import 'package:mobile_app/di.dart';
import 'package:mobile_app/initilizer.dart';
// import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';

import 'app/app.dart';
import 'core/config/app_config.dart';
import 'core/values/flavor/flavor.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await dotenv.load(fileName: "assets/environments/.env.dev");

      final appConfig = Get.put(
        AppConfig(
          flavor: AppFlavor.dev,
          appName: dotenv.get('APP_NAME'),
          appIcon: dotenv.get('APP_ICON'),
          apiBaseUrl: dotenv.get('API_BASE_URL'),
          storageUrl: dotenv.get('STORAGE_URL'),
          connectionCheckerUrl: dotenv.get('CONNECTION_CHECKER_URL'),
          // firebaseApiKey: dotenv.get('FIREBASE_API_KEY'),
          // firebaseAppId: dotenv.get('FIREBASE_APP_ID'),
          // firebaseMessagingSenderId:
          //     dotenv.get('FIREBASE_MESSAGING_SENDER_ID'),
          // firebaseProjectId: dotenv.get('FIREBASE_PROJECT_ID'),
          storageKey: dotenv.get('STORAGE_KEY'),
          version: dotenv.get('VERSION'),
          storageVersion: dotenv.get('STORAGE_VERSION'),
          playStoreLink: dotenv.get('PLAY_STORE_LINK'),
          appStoreLink: dotenv.get('APP_STORE_LINK'),
        ),
        permanent: true,
      );

      await Initializer(appConfig).run();
      await DependencyInjection(appConfig).init();

      await AppInitializer().run();
      await AppDependencyInjection().init();

      runApp(
        DevicePreview(
          enabled: true,
          builder: (context) =>
              Sizer(builder: (context, orientation, deviceType) => App()),
        ),
      );
    },
    (error, stack) {
      FlutterError.reportError(
        FlutterErrorDetails(exception: error, stack: stack),
      );
    },
  );
}

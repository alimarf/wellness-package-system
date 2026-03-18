import 'dart:convert';
import 'dart:developer';


// import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/di.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';



import 'core/config/app_config.dart';

import 'core/networking/api_client.dart';
import 'core/networking/interceptor/api_interceptor.dart';
import 'core/services/auth_token_manager.dart';
import 'core/services/network_info_manager.dart';
import 'core/services/notification_manager.dart';
import 'core/values/flavor/flavor.dart';

class DependencyInjection {
  final AppConfig appConfig;

  DependencyInjection(this.appConfig);

  Future<void> init() async {
    try {
      // await _initFirebase();

      // Analytics

      // final analytics = FirebaseAnalytics.instance;
      // FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
      //   analytics: analytics,
      //   routeFilter: (_) => true,
      // );
      // Get.put(AppAnalytics(instance: analytics, observer: observer));

      //FiRESTORE
      // Get.put<FirebaseFirestore>(FirebaseFirestore.instance);

      // Crashlytics

      // if (!GetPlatform.isWeb) {
      //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      //   FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      // }

      // Messaging

      // await FirebaseMessaging.instance.setAutoInitEnabled(true);

      // NotificationManager notificationManager = NotificationManager();

      // if (GetPlatform.isIOS) {
      //   await notificationManager.requestIOSPermissions();
      // }

      // await notificationManager.init();

      // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //   var id = UniqueKey().hashCode;

      //   if (GetPlatform.isIOS) {
      //     return;
      //   }

      //   if (message.notification != null) {
      //     notificationManager.showNotification(
      //       title: message.notification?.title ?? "",
      //       body: message.notification?.body ?? "",
      //       payload: jsonEncode(message.data),
      //       id: id,
      //     );
      //   } else {
      //     var data = message.data;
      //     notificationManager.showNotification(
      //       title: data['title'],
      //       body: data['body'],
      //       payload: jsonEncode(data),
      //       id: id,
      //     );
      //   }
      // });

      // await FirebaseMessaging.instance
      //     .setForegroundNotificationPresentationOptions(
      //   alert: true,
      //   badge: true,
      //   sound: true,
      // );

      // Alice? alice;

      // if (!GetPlatform.isWeb) {
      //   alice = Alice(
      //       showInspectorOnShake: true,
      //       showShareButton: true,
      //       showNotification: false);
      //   await Get.putAsync<Alice>(() async => alice!);
      // }

      // String apiUrl = dotenv.env['API_BASE_URL']!;

      // log('api url: ${apiUrl}');

      // try {
      //   // final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

      //   // await remoteConfig.setConfigSettings(
      //   //   RemoteConfigSettings(
      //   //     fetchTimeout: const Duration(seconds: 10),
      //   //     minimumFetchInterval: Duration.zero,
      //   //   ),
      //   // );

      //   // await remoteConfig.fetchAndActivate();

      //   // final remoteConfigApiUrl = remoteConfig.getString(
      //   //     '${AppConfig.instance.flavor.text.toUpperCase()}_API_URL');


      //   // if (remoteConfigApiUrl.isNotEmpty) {
      //   //   apiUrl = remoteConfigApiUrl;
      //   // }

      // } catch (e) {
      //   log(e.toString());
      // }

   

      Get.put(NetworkInfoManager(), permanent: true);
      Get.put(AuthTokenManager(), permanent: true);
      Get.put(
        ApiClient(
          baseUrl: AppConfig.instance.apiBaseUrl,
          interceptors: (kDebugMode ||
                      AppConfig.instance.flavor == AppFlavor.dev ||
                      AppConfig.instance.flavor == AppFlavor.staging) &&
                  !GetPlatform.isWeb
              ? [
                  ApiInterceptor(
                    tokenManager: Get.find<AuthTokenManager>(),
                    appConfig: Get.find<AppConfig>(),
                  ),
                  // alice!.getDioInterceptor(),
                  CurlLoggerDioInterceptor(printOnSuccess: true),
                  
                  // PrettyDioLogger(
                  //     requestHeader: true,
                  //     requestBody: true,
                  //     responseBody: true,
                  //     responseHeader: false,
                  //     error: true,
                  //     compact: true,
                  //     maxWidth: 90),
                ]
              : [
                  ApiInterceptor(
                    tokenManager: Get.find<AuthTokenManager>(),
                    appConfig: Get.find<AppConfig>(),
                  ),
                  // CurlLoggerDioInterceptor(printOnSuccess: true),
                  // PrettyDioLogger(
                  //     requestHeader: true,
                  //     requestBody: true,
                  //     responseBody: true,
                  //     responseHeader: false,
                  //     error: true,
                  //     compact: true,
                  //     maxWidth: 90),

                ],
        ),
        permanent: true,
      );
      AppDependencyInjection().init();
    } catch (e) {
      log(e.toString());
    }
  }

  // Future<void> _initFirebase() async {
  //   try {
  //     if (GetPlatform.isWeb) {
  //       await Firebase.initializeApp(
  //           options: const FirebaseOptions(
  //         apiKey: 'AIzaSyBntW0laStbqo7MMY78-2uSMQ0tlAEELJ0',
  //         appId: "1:689235992675:web:8b59aea4388bb6f456d856",
  //         messagingSenderId: "689235992675",
  //         projectId: "feedback-e9f0e",
  //       ));
  //     } else {
  //       await Firebase.initializeApp();
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}

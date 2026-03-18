import 'dart:developer';

import 'package:dio/dio.dart' as Dio;

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../config/app_config.dart';
import '../../exceptions/cache_exception.dart';
import '../../services/auth_token_manager.dart';

class ApiInterceptor extends Dio.Interceptor {
  final AppConfig appConfig;
  final AuthTokenManager tokenManager;

  ApiInterceptor({required this.appConfig, required this.tokenManager});

  Future<void> signOut() async {
    // Clear all caches
    await Get.find<AuthTokenManager>().clear();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // if (Get.currentRoute == SharedRoutes.INFORMATION) {
      //   return;
      // }

      // Get.offAllNamed(SharedRoutes.INFORMATION, parameters: {
      //   'title': 'Token isn\'t valid'.tr,
      //   'description': 'Please re-login to update the session',
      //   'navigation_label': 'Login',
      //   'destination': AuthRoutes.LOGIN
      // });
    });
  }

  @override
  Future<void> onRequest(
      Dio.RequestOptions options, Dio.RequestInterceptorHandler handler) async {
    try {
      // final getUser = Get.find<GetUser>();

      // if (!options.path.contains('/Logon')) {
      //   final result = await getUser.execute();

      //   result.fold(
      //     (l) {
      //       if (l.data?.masterKey != null) {
      //         options.queryParameters['MasterKey'] = l.data?.masterKey;
      //       }
      //     },
      //     (r) {
      //       if (r.data?.masterKey != null) {
      //         options.queryParameters['MasterKey'] = r.data?.masterKey;
      //       }
      //     },
      //   );
      // }
    } on CacheException catch (e) {
      log("CacheException occurred: $e");
    } catch (e) {
      log("An error occurred: $e");
    } finally {
      final token = tokenManager.getAccessToken();
      if (token != null && !options.uri.toString().contains('login')) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      super.onRequest(options, handler);
    }
  }

  @override
  void onResponse(
      Dio.Response response, Dio.ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      signOut();
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(Dio.DioException error, Dio.ErrorInterceptorHandler handler) {
    if (error.response?.statusCode == 401 &&
        error.response?.realUri.toString().contains('/login') == false) {
      signOut();
    }
    return super.onError(error, handler);
  }
}

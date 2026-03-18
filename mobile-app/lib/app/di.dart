import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'modules/main/di.dart';
import 'modules/package/di.dart';

class AppDependencyInjection {
  AppDependencyInjection();

  Future<void> init() async {
    Get.lazyPut(() => CancelToken(), fenix: true);

    MainDependencyInjection().init();
    PackageDependencyInjection().init();
  }
}

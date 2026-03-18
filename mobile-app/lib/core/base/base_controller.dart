import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../values/state/app_state.dart';

class BaseController extends GetxController {
  final state = Rx<AppState>(AppState.Initial);
  final nextState = Rx<AppState>(AppState.Initial);
  final errorMessage = RxString('');
  final cancelToken = Get.find<CancelToken>();
}

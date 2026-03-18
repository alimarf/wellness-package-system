import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';

import 'core/config/app_config.dart';
import 'core/utils/log/logger.dart';

class Initializer {
  final AppConfig appConfig;

  Initializer(this.appConfig);

  Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();

    if (!GetPlatform.isWeb) {
      _setScreenOrientation();
      await initializeDateFormatting('id_ID', null);
    }

    await _initStorage();
    await _initLogger();
  }

  void _setScreenOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Future<void> _initStorage() async {
    if (GetPlatform.isWeb) {
      Hive.initFlutter();
    } else {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }

    await Hive.openBox('auth');
  }

  Future<void> _initLogger() async {
    await AppLogger.initLogFile();
  }
}

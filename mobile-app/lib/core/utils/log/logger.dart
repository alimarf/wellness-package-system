import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class AppLogger {
  static File? _logFile;

  static Future<void> initLogFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final logFilePath = '${directory.path}/app_logs.txt';

      _logFile = File(logFilePath);

      if (!(await _logFile!.exists())) {
        await _logFile!.create();
      }
    } catch (e) {
      log('Error initializing log file: $e');
    }
  }

  static Future<String?> getPath() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final logFilePath = '${directory.path}/app_logs.txt';

      return logFilePath;
    } catch (e) {
      log('Error return path of log file: $e');
    }
  }

  // static Future<void> logs(
  //     {required String key,
  //     required String message,
  //     Map<String, dynamic>? data,
  //     StackTrace? stackTrace,
  //     LogLevel logLevel = LogLevel.WARN}) async {
  //   if (_logFile == null) {
  //     await initLogFile();
  //     log('Log file not initialized.');
  //   }

  //   log('[$key] $message');

  //   try {
  //     final alice = Get.find<Alice>();

  //     alice.addLog(AliceLog(message: '[$key] $message'));

  //     final timestamp = DateTime.now().toIso8601String();
  //     final logEntry = '[$timestamp] [${Get.currentRoute}] [$key] $message\n';

  //     await _logFile!.writeAsString(
  //       logEntry,
  //       mode: FileMode.append,
  //       flush: true,
  //     );
  //   } catch (e) {
  //     log('Error writing log: $e');
  //   }
  // }

  // static Future<void> logsError(
  //     {required String key,
  //     error,
  //     Map<String, dynamic>? data,
  //     stacktrace}) async {
  //   if (_logFile == null) {
  //     await initLogFile();
  //     log('Log file not initialized.');
  //   }

  //   try {
  //     await FirebaseCrashlytics.instance.recordError(error, stacktrace,
  //         reason: error.toString(), fatal: true);
  //     logs(
  //         key: key,
  //         stackTrace: stacktrace,
  //         data: data,
  //         message: jsonEncode({
  //           'error': error.toString(),
  //           'data': data,
  //         }),
  //         logLevel: LogLevel.ERROR);
  //   } catch (e) {
  //     log('Error writing log: $e');
  //   }
  // }

  static Future<String> readLogs() async {
    if (_logFile == null) {
      log('Log file not initialized.');
      return '';
    }

    try {
      return await _logFile!.readAsString();
    } catch (e) {
      log('Error reading log file: $e');
      return '';
    }
  }

  static Future<void> clearLogs() async {
    if (_logFile == null) {
      log('Log file not initialized.');
      return;
    }

    try {
      await _logFile!.writeAsString('');
    } catch (e) {
      log('Error clearing log file: $e');
    }
  }
}

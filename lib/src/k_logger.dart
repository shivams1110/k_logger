import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

enum LogType { verbose, debug, info, warning, error }

class KLogger {
  static void i(dynamic message) {
    log(message: message, color: "\x1B[36m", errorType: LogType.info.name);
  }

  static void v(dynamic message) {
    log(message: message, errorType: LogType.verbose.name, color: "\x1B[34m");
  }

  static void d(dynamic message) {
    log(message: message, errorType: LogType.debug.name, color: "\x1B[32m");
  }

  static void w(dynamic message) {
    log(message: message, errorType: LogType.warning.name, color: "\x1B[33m");
  }

  static void e(dynamic message) {
    log(message: message, errorType: LogType.error.name, color: "\x1B[31m");
  }

  static void log(
      {dynamic message, required String color, required String errorType}) {
    if (kDebugMode) {
      print(
          "$color*** $errorType log Start ${DateFormat("dd-MM-yyyy HH:mm:ss").format(DateTime.now())} ***\x1B[0m");
      print("$color$message\x1B[0m");
      print("$color*** $errorType log End ***\x1B[0m");
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final _logger = Logger();

  static void logDebug(dynamic message,
      [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _logger.d(message, error, stackTrace);
    }
  }

  static void logError(dynamic message,
      [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _logger.e(message, error, stackTrace);
    }
  }
}

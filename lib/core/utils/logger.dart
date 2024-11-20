import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger();

  static void log(String message) {
    _logger.i(message); // Log informational message.
  }

  static void debug(String message) {
    _logger.d(message); // Log debug message.
  }

  static void warn(String message) {
    _logger.w(message); // Log warning message.
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message,error: error, stackTrace: stackTrace); // Log error with optional details.
  }
}

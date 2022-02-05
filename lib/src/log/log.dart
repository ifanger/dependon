import 'dart:developer' as developer;

import 'package:dependon/dependon.dart';
import 'package:dependon/src/enum/log_level.dart';

/// Logs a message into console if [LogLevel] is equals to [LogLevel.debug].
void logIfAvailable(String message) {
  if (DependencyInjection.logLevel == LogLevel.debug) {
    developer.log(message, name: 'DependOn');
  }
}

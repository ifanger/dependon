import 'dart:developer' as developer;

class DependonLogger {
  bool enabled = false;

  void log(String message) {
    if (!enabled) {
      return;
    }

    developer.log('Dependon: $message');
  }
}

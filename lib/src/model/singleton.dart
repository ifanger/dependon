import 'package:dependon/src/log/log.dart';
import 'package:dependon/src/model/definition.dart';
import 'package:dependon/src/utils/initialization.dart';

/// Every time `get` is called an existing instance of the object will return.
class Singleton<T> extends Definition<T> {
  Singleton(this.initialization);

  /// Instruction for object initialization.
  final Initialization initialization;

  /// Internal control variable for singleton.
  T? _instance;

  /// Returns an existing instance of [T]. If no instance was created
  /// [initialization] is called.
  @override
  T get instance {
    if (_instance == null) {
      _instance = initialization.call();
      logIfAvailable('$T created');
    }

    return _instance!;
  }

  /// Returns the primary [type] of [T].
  @override
  Type get type => T;
}

import 'package:dependon/core/model/definition.dart';
import 'package:dependon/core/utils/initialization.dart';

/// Every time `get` is called an existing instance of the object will return.
class Singleton<T> extends Definition<T> {
  Singleton({this.initialization, this.object})
      : assert(initialization != null || object != null);

  /// Instruction for object initialization.
  final Initialization? initialization;

  /// The instance already created, if provided.
  final Object? object;

  /// Internal control variable for singleton.
  T? _instance;

  /// Returns an existing instance of [T]. If no instance was created or
  /// provided [initialization] is called.
  @override
  T get instance {
    if (_instance == null) {
      if (object != null) {
        _instance = object as T;
      } else if (initialization != null) {
        _instance = initialization?.call();
      }
    }

    return _instance!;
  }

  /// Returns the primary [type] of [T].
  @override
  Type get type => T;
}

import 'package:dependon/src/log/log.dart';
import 'package:dependon/src/model/definition.dart';
import 'package:dependon/src/utils/initialization.dart';

/// A factory definition is an object that will be created every time `get` is
/// called.
class Factory<T> extends Definition<T> {
  Factory(this.initialization);

  /// Instruction for object initialization.
  final Initialization initialization;

  /// Retrieves a new instance of [T].
  @override
  T get instance {
    logIfAvailable('$T created');
    return initialization.call();
  }

  /// Returns the primary [type] of [T].
  @override
  Type get type => T;
}

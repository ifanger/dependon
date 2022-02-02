import 'package:dependon/core/model/definition.dart';
import 'package:dependon/core/utils/initialization.dart';

/// A factory definition is an object that will be created every time `get` is
/// called.
class Factory<T> extends Definition<T> {
  Factory(this.initialization);

  /// Instruction for object initialization.
  final Initialization initialization;

  /// Retrieves a new instance of [T].
  @override
  T get instance {
    return initialization.call();
  }

  /// Returns the primary [type] of [T].
  @override
  Type get type => T;
}

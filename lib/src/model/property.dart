import 'package:dependon/src/log/log.dart';
import 'package:dependon/src/model/definition.dart';

/// Holds the instance of an [object] that can be retrieved anywhere.
class Property<T> extends Definition<T> {
  /// Constructor should receive the instance of the [object].
  Property(this.object);

  /// The instance of the object.
  final T object;

  /// Retrieves the instance.
  @override
  T get instance {
    logIfAvailable('$T added to definitions');
    return object;
  }

  /// Returns the type of the [object].
  @override
  Type get type => T;
}

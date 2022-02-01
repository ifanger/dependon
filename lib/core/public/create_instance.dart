import 'package:dependon/core/dependency_injection.dart';
import 'package:dependon/core/error/dependency_error.dart';

/// Creates a non-lazy singleton instance of the provided object [clazz].
///
/// Throws a [DependencyError] when the object is already declared.
///
/// Example:
/// ```
/// createInstance(ServerDefaults());
/// ```
void createInstance<T>(Object clazz) {
  DependencyInjection.instance.createInstance(clazz);
}

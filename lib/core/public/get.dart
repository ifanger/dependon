import 'package:dependon/core/dependency_injection.dart';

/// Retrieves the object depending on the declared.
///
/// When `get` is called a new instance of that object will be created.
///
/// Throws a [DependencyError] when no instance or initialization is provided.
///
/// Example:
/// ```
/// get&lt;UserRepository&gt;();
/// ```
T get<T>() {
  return DependencyInjection.instance.get();
}

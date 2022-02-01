import 'package:dependon/core/dependency_injection.dart';

/// Creates a lazy instance of a factory that will execute the provided
/// initialization.
///
/// When `get` is called a new instance of that object will be created.
///
/// Throws a [DependencyError] when the object is already declared.
///
/// Example:
/// ```
/// factory(() => UserService());
/// ```
void factory<T>(T Function() initialization) {
  DependencyInjection.instance.factory(initialization);
}

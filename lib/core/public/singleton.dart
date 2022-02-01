import 'package:dependon/core/dependency_injection.dart';

/// Creates a lazy instance of a singleton that will execute the provided
/// initialization.
///
/// When `get` is called a new instance of that object will be created if
/// no instance is already created.
///
/// Throws a [DependencyError] when the object is already declared.
///
/// Example:
/// ```
/// singleton(() => UserRepository());
/// ```
void singleton<T>(T Function() initialization) {
  DependencyInjection.instance.singleton(initialization);
}

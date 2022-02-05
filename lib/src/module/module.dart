import 'package:dependon/src/dependency_injection.dart';

/// A module contains definitions that will be loaded by the application.
abstract class Module {
  /// [DependencyInjection] instance.
  final DependencyInjection _dependencyInjection = DependencyInjection.instance;

  /// Implements all module's definitions.
  ///
  /// Usage:
  /// ```
  /// @override
  /// void dependencies() {
  ///   singleton<UserRepository>(UserRepositoryImpl());
  /// }
  /// ```
  void dependencies();

  /// Loads Module's dependencies into memory.
  void load() => dependencies();

  /// Creates a lazy instance of a singleton that will execute the provided
  /// initialization.
  void singleton<T>(T Function() initialization) =>
      _dependencyInjection.singleton<T>(initialization);

  /// Creates a lazy instance of a factory that will execute the provided
  /// initialization.
  void factori<T>(T Function() initialization) =>
      _dependencyInjection.factori<T>(initialization);

  /// Sets a property that can be accessed anywhere later.
  /// Note that the object will `NOT` be lazy initialized.
  void property<T>(T object) => _dependencyInjection.property<T>(object);

  /// Returns the instance of the required type.
  T get<T>() => _dependencyInjection.get<T>();

  @override
  String toString() {
    return '$runtimeType';
  }
}

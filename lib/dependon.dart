library dependon;

import 'package:dependon/src/errors/dependency_injection_error.dart';
import 'package:dependon/src/logger/dependon_logger.dart';
import 'package:dependon/src/models/controller/injectable_controller.dart';
import 'package:dependon/src/models/factory/injectable_factory.dart';
import 'package:dependon/src/models/injectable.dart';
import 'package:dependon/src/models/singleton/injectable_singleton.dart';

part 'src/dependon_impl.dart';

/// Shortcut for `Dependon.instance.get()`
///
/// Returns the requested object by type.
///
/// Usage:
/// ```dart
/// final UserRepository _userRepository = get<UserRepository>();
/// ```
T get<T extends Object>() => Dependon._instance.get<T>();

/// Dependency injection management.
///
/// ```dart
/// final Dependon di = Dependon.instance;
/// di.singleton<UserRepository>(() => UserRepositoryImpl(get()));
/// ```
abstract class Dependon {
  Dependon._();

  static final Dependon _instance = _DependonImpl._();

  static final DependonLogger _logger = DependonLogger();

  /// Retrieves the existing instance of `DependencyInjection`.
  static Dependon get instance => _instance;

  /// Returns the requested object by type.
  ///
  /// Usage:
  /// ```dart
  /// final Dependon di = Dependon.instance;
  /// final UserRepository _userRepository = di.get<UserRepository>();
  /// // or
  /// final UserRepository _userRepository = get<UserRepository>();
  /// ```
  T get<T extends Object>({final String? tag});

  /// Registers a new creation's instruction for a `factory`.
  ///
  /// **Usage:**
  /// ```dart
  /// factory<CounterBloc>(() => CounterBloc(get()));
  /// ```
  void factory<T extends Object>(T Function() builder);

  /// Creates a new `singleton` registration.
  /// Be careful: when declaring non-lazy singletons your
  /// dependencies *MUST* has been declared *BEFORE* the current one.
  ///
  /// **Usage:**
  /// ```dart
  /// singleton(() => HttpProvider());
  /// singleton<UserRepository>(() => UserRepositoryImpl(get()));
  /// singleton(() => AuthenticationListener(get()), lazy: false);
  /// ```
  void singleton<T extends Object>(
    T Function() builder, {
    final String? tag,
    final bool lazy = true,
  });

  /// Creates a `controller` instance which represents a singleton that is
  /// lazy initialized and can be unset.
  ///
  /// This instance is useful for share the same instance with multiple listeners.
  ///
  /// **Usage:**
  /// ```dart
  /// controller<UserCreateBloc>(() => UserCreateBloc(get()));
  /// ```
  void controller<T extends Object>(T Function() builder, {final String? tag});

  /// Deletes the current existing instance of the provided object but keeps the
  /// creation instruction.
  ///
  /// If no instances were created nothing will happen.
  ///
  /// **Note:** this method works only with `controller`.
  void unset<T extends Object>({final String? tag});

  /// Removes the registration of the provided type.
  ///
  /// **Usage:**
  /// ```dart
  /// remove<DataStorage>();
  /// ```
  void remove<T extends Object>({final String? tag});

  /// Removes all the registrations in the dependency injection map.
  void clear();

  /// Dependency injection logs.
  void enableLogging([bool enabled = false]);
}

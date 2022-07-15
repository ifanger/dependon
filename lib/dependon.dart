library dependon;

import 'package:dependon/src/errors/dependency_injection_error.dart';
import 'package:dependon/src/logger/dependon_logger.dart';
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
  T get<T extends Object>();

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
  void singleton<T extends Object>(T Function() builder, {bool lazy = true});

  /// Removes the registration of the provided type.
  ///
  /// **Usage:**
  /// ```dart
  /// remove<DataStorage>();
  /// ```
  void remove<T extends Object>();

  /// Removes all the registrations in the dependency injection map.
  void clear();

  /// Dependency injection logs.
  void enableLogging([bool enabled = false]);
}

library dependon;

part 'dependon_impl.dart';

T get<T extends Object>() => Dependon._instance.get<T>();

abstract class Dependon {
  Dependon._();

  static final Dependon _instance = _DependonImpl();

  /// Retrieves the existing instance of `DependencyInjection`.
  static Dependon get instance => _instance;

  /// Returns the requested object by type.
  ///
  /// Usage:
  /// ```dart
  /// final UserRepository _userRepository = get<UserRepository>();
  /// ```
  T get<T extends Object>();

  /// Registers a new creation's instruction for a `factory`.
  ///
  /// Usage:
  /// ```dart
  /// registerFactory<CounterBloc>(() => CounterBloc(get()));
  /// ```
  void registerFactory<T extends Object>(T Function() builder);

  /// Registers the object provided by `instance` into the dependencies tree.
  /// Note that singletons that are not lazy-initialized should always respect
  /// the register order. You should never call `get()` inside `registerSingleton`
  /// before the parameter's registration.
  ///
  /// Usage:
  /// ```dart
  /// // before the singleton registration
  /// registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(get()));
  ///
  /// // after all dependencies registration
  /// registerSingleton<AuthenticationListener>(AuthenticationListener(get<AuthenticationRepository>()));
  /// ```
  void registerSingleton<T extends Object>(T instance);

  /// Registers a new creation's instruction for a `singleton`.
  /// The instance of this singleton will only be created when requested.
  ///
  /// Usage:
  /// ```dart
  /// registerLazySingleton<UserRepository>(() => UserRepositoryImpl(get()));
  /// ```
  void registerLazySingleton<T extends Object>(T Function() builder);
}

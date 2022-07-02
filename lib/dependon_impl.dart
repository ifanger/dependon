part of 'dependon.dart';

abstract class _Injectable<T extends Object> {
  _Injectable(this.builder);

  T Function() builder;
}

class _InjectableFactory<T extends Object> extends _Injectable<T> {
  _InjectableFactory(T Function() builder) : super(builder);

  T create() => builder.call();
}

class _InjectableLazySingleton<T extends Object> extends _Injectable<T> {
  _InjectableLazySingleton(T Function() builder) : super(builder);

  T? _instance;

  T retrieve() {
    return _instance ??= builder();
  }
}

class _InjectableSingleton<T extends Object> extends _Injectable<T> {
  _InjectableSingleton(
    this.instance,
    T Function() builder,
  ) : super(builder);

  T instance;
}

class _DependonImpl extends Dependon {
  _DependonImpl() : super._();

  final Map<String, _Injectable<Object>> dependencies = {};

  @override
  void registerFactory<T extends Object>(T Function() builder) {
    _register(_InjectableFactory<T>(builder));
  }

  @override
  void registerSingleton<T extends Object>(T instance) {
    _register(_InjectableSingleton<T>(instance, () => instance));
  }

  @override
  void registerLazySingleton<T extends Object>(T Function() builder) {
    _register(_InjectableLazySingleton<T>(builder));
  }

  @override
  T get<T extends Object>() {
    final String name = T.toString();

    if (!dependencies.containsKey(name)) {
      throw Exception('No implementation found for $name.');
    }

    final _Injectable<T> injectable = dependencies[name]! as _Injectable<T>;

    if (injectable is _InjectableFactory<T>) {
      return injectable.create();
    } else if (injectable is _InjectableSingleton<T>) {
      return injectable.instance;
    } else if (injectable is _InjectableLazySingleton<T>) {
      return injectable.retrieve();
    }

    throw Exception('Invalid injectable type of $name.');
  }

  void _register<T extends Object>(_Injectable<T> injectable) {
    final String name = T.toString();

    if (dependencies.containsKey(name)) {
      throw Exception('Dependency $name is already registered.');
    }

    dependencies[name] = injectable;
  }
}

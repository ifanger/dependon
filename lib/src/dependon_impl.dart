part of '../dependon.dart';

void diLog(String message) => Dependon._logger.log(message);

class _DependonImpl extends Dependon {
  _DependonImpl._() : super._();

  final Map<String, Injectable<Object>> dependencies = {};

  @override
  void factory<T extends Object>(T Function() builder) {
    _register(InjectableFactory<T>(builder));
  }

  @override
  void singleton<T extends Object>(
    T Function() builder, {
    bool lazy = true,
  }) {
    _register(InjectableSingleton<T>(builder, lazy: lazy));
  }

  @override
  T get<T extends Object>() {
    final String name = T.toString();

    if (!dependencies.containsKey(name)) {
      throw DependencyInjectionError('No implementation found for $name.');
    }

    final Injectable<T> injectable = dependencies[name]! as Injectable<T>;

    if (injectable is InjectableFactory<T>) {
      return injectable.create();
    } else if (injectable is InjectableSingleton<T>) {
      return injectable.retrieve();
    }

    throw DependencyInjectionError('Invalid injectable type of $name.');
  }

  void _register<T extends Object>(Injectable<T> injectable) {
    final String name = T.toString();

    if (dependencies.containsKey(name)) {
      throw DependencyInjectionError('Dependency $name is already registered.');
    }

    dependencies[name] = injectable;
    diLog('$name registered');
  }

  @override
  void enableLogging([bool enabled = false]) {
    Dependon._logger.enabled = enabled;

    if (enabled) {
      diLog('Logs enabled');
    }
  }
}

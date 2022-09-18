part of '../dependon.dart';

void diLog(String message) => Dependon._logger.log(message);

class _DependonImpl extends Dependon {
  _DependonImpl._() : super._();

  final Map<String, Injectable<Object>> dependencies = {};

  @override
  T get<T extends Object>({final String? tag}) {
    String name = T.toString();

    if (tag?.isNotEmpty == true) {
      name += '_$tag';
    }

    if (!dependencies.containsKey(name)) {
      throw DependencyInjectionError('No implementation found for $name.');
    }

    final Injectable<T> injectable = dependencies[name]! as Injectable<T>;

    if (injectable is InjectableFactory<T>) {
      return injectable.create();
    } else if (injectable is InjectableSingleton<T>) {
      return injectable.retrieve();
    } else if (injectable is InjectableController<T>) {
      return injectable.retrieve();
    }

    throw DependencyInjectionError('Invalid injectable type of $name.');
  }

  @override
  void factory<T extends Object>(T Function() builder) {
    _register(InjectableFactory<T>(builder));
  }

  @override
  void singleton<T extends Object>(
    T Function() builder, {
    final String? tag,
    final bool lazy = true,
  }) {
    _register(InjectableSingleton<T>(
      builder,
      lazy: lazy,
      tag: tag,
    ));
  }

  @override
  void controller<T extends Object>(T Function() builder, {final String? tag}) {
    _register(InjectableController<T>(builder, tag: tag));
  }

  @override
  void unset<T extends Object>({final String? tag}) {
    String name = T.toString();

    if (tag?.isNotEmpty == true) {
      name += '_$tag';
    }

    try {
      final InjectableController<T>? controller =
          dependencies[name] as InjectableController<T>?;
      controller?.unset();
    } catch (e) {
      throw DependencyInjectionError(
          '$name is not created or not a controller.');
    }
  }

  @override
  void remove<T extends Object>({final String? tag}) {
    String name = T.toString();

    if (tag?.isNotEmpty == true) {
      name += '_$tag';
    }

    dependencies.removeWhere((key, value) => key == name);

    diLog('$name removed from dependencies');
  }

  @override
  void clear() {
    dependencies.clear();
    diLog('Dependencies cleared');
  }

  @override
  void enableLogging([bool enabled = false]) {
    Dependon._logger.enabled = enabled;

    if (enabled) {
      diLog('Logs enabled');
    }
  }

  void _register<T extends Object>(Injectable<T> injectable) {
    String name = T.toString();

    if (injectable is InjectableSingleton<T> &&
        injectable.tag?.isNotEmpty == true) {
      name += '_${injectable.tag}';
    } else if (injectable is InjectableController<T> &&
        injectable.tag?.isNotEmpty == true) {
      name += '_${injectable.tag}';
    }

    if (dependencies.containsKey(name)) {
      throw DependencyInjectionError('Dependency $name is already registered.');
    }

    dependencies[name] = injectable;
    diLog('$name registered');
  }
}

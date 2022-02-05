import 'package:dependon/src/enum/log_level.dart';
import 'package:dependon/src/error/dependency_error.dart';
import 'package:dependon/src/log/log.dart';
import 'package:dependon/src/model/definition.dart';
import 'package:dependon/src/model/factory.dart';
import 'package:dependon/src/model/property.dart';
import 'package:dependon/src/model/singleton.dart';
import 'package:dependon/src/module/module.dart';

/// Main dependency injection class.
class DependencyInjection {
  final Set<Definition<dynamic>> _definitions = {};

  static DependencyInjection? _instance;
  static LogLevel _logLevel = LogLevel.debug;

  /// Returns the current instance of [DependencyInjection].
  static DependencyInjection get instance {
    _instance ??= DependencyInjection();
    return _instance!;
  }

  /// Returns the level of logging.
  static LogLevel get logLevel => _logLevel;

  /// Loads [Module]'s definitions into application's definitions.
  void loadModule(Module module) {
    module.load();
    logIfAvailable('Module $module loaded into memory');
  }

  /// Loads definitions of a [List] of [Module] into application's
  /// definitions.
  void loadModules(Iterable<Module> modules) {
    for (final Module module in modules) {
      loadModule(module);
    }
  }

  /// Creates a lazy instance of a singleton that will execute the provided
  /// initialization.
  void singleton<T>(T Function() initialization) {
    _addDefinition(Singleton<T>(initialization));
  }

  /// Creates a lazy instance of a factory that will execute the provided
  /// initialization.
  void factori<T>(T Function() initialization) {
    _addDefinition(Factory<T>(initialization));
  }

  /// Sets a property that can be accessed anywhere later.
  /// Note that the object will `NOT` be lazy initialized.
  void property<T>(T object) {
    _addDefinition(Property<T>(object));
  }

  void _addDefinition<T>(Definition<T> creation) {
    _definitions.add(creation);
  }

  /// Returns the instance of the required type.
  T get<T>() {
    try {
      final Definition<dynamic> singleton =
          _definitions.lastWhere((e) => e.type == T);

      return singleton.instance as T;
    } catch (_) {
      throw DependencyError(
          "No declaration of $T has been found. Check your definitions.");
    }
  }

  /// Sets the log's level.
  ///
  /// When [LogLevel.debug] is set, all DependOn operations will be printed
  /// on the console.
  /// If [LogLevel] is set to [LogLevel.none], no log message will be outputted.
  void setLogLevel(LogLevel logLevel) {
    DependencyInjection._logLevel = logLevel;
  }
}

/// Returns the instance of the required type.
T get<T>() => DependencyInjection.instance.get();

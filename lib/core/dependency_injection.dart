import 'package:dependon/core/error/dependency_error.dart';
import 'package:dependon/core/model/definition.dart';
import 'package:dependon/core/model/factory.dart';
import 'package:dependon/core/model/singleton.dart';
import 'package:dependon/core/utils/collection.dart';

/// Main dependency injection class.
class DependencyInjection {
  final Set<Definition<dynamic>> _instances = {};

  static DependencyInjection? _instance;

  /// Returns the current instance of [DependencyInjection].
  static DependencyInjection get instance {
    _instance ??= DependencyInjection();
    return _instance!;
  }

  /// Creates a lazy instance of a singleton that will execute the provided
  /// initialization.
  void singleton<T>(T Function() initialization) {
    _declareComponent(Singleton<T>(initialization: initialization));
  }

  /// Creates a lazy instance of a factory that will execute the provided
  /// initialization.
  void factory<T>(T Function() initialization) {
    _declareComponent(Factory<T>(initialization));
  }

  void _declareComponent<T>(Definition<T> creation) {
    final component =
        _instances.firstWhereOrNull((element) => element.type == T);

    if (component == null) {
      _instances.add(creation);
    } else {
      throw DependencyError("$T is already declared.");
    }
  }

  /// Retrieves the object depending on the declared.
  T get<T>() {
    final Definition<dynamic>? singleton =
        _instances.firstWhereOrNull((e) => e.type == T);

    if (singleton != null) {
      return singleton.instance as T;
    } else {
      throw DependencyError(
          "No declaration of $T has been found. Check your definitions.");
    }
  }
}

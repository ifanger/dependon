import 'package:dependon/core/error/dependency_error.dart';
import 'package:dependon/core/model/creation.dart';
import 'package:dependon/core/model/factory.dart';
import 'package:dependon/core/model/singleton.dart';
import 'package:dependon/core/utils/collection.dart';

class DependencyInjection {
  final Set<Creation<dynamic>> _instances = {};

  static DependencyInjection? _instance;

  static DependencyInjection get instance {
    _instance ??= DependencyInjection();
    return _instance!;
  }

  void createInstance<T>(Object clazz) {
    _declareComponent(Singleton<T>(object: clazz));
  }

  void singleton<T>(T Function() initialization) {
    _declareComponent(Singleton<T>(initialization: initialization));
  }

  void factory<T>(T Function() initialization) {
    _declareComponent(Factory<T>(initialization));
  }

  void _declareComponent<T>(Creation<T> creation) {
    final component =
        _instances.firstWhereOrNull((element) => element.type == T);

    if (component == null) {
      _instances.add(creation);
    } else {
      throw DependencyError("$T is already declared.");
    }
  }

  T get<T>() {
    final Creation<dynamic>? singleton =
        _instances.firstWhereOrNull((e) => e.type == T);

    if (singleton != null) {
      return singleton.instance as T;
    } else {
      throw DependencyError(
          "No declaration of $T has been found. Check your definitions.");
    }
  }
}

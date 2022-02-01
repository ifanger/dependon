import 'package:dependon/core/model/creation.dart';

class Singleton<T> extends Creation<T> {
  Singleton({this.initialization, this.object})
      : assert(initialization != null || object != null);

  final Function()? initialization;
  final Object? object;

  T? _instance;

  @override
  T get instance {
    if (_instance == null) {
      if (initialization != null) {
        _instance = initialization?.call();
      } else if (object != null) {
        _instance = object as T;
      }
    }

    return _instance!;
  }

  @override
  Type get type => T;
}

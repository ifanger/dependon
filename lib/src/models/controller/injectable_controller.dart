import 'package:dependon/dependon.dart';
import 'package:dependon/src/models/injectable.dart';

class InjectableController<T extends Object> extends Injectable<T> {
  InjectableController(
    T Function() builder, {
    this.tag,
  }) : super(builder);

  final String? tag;

  T? _instance;

  T retrieve() {
    if (_instance == null) {
      _instance = builder();
      diLog('Created controller ${T.toString()}');
    }

    diLog('Retrieved controller ${T.toString()}');

    return _instance!;
  }

  void unset() {
    _instance = null;
  }
}

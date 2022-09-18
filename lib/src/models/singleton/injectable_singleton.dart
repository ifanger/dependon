import 'package:dependon/dependon.dart';
import 'package:dependon/src/models/injectable.dart';

class InjectableSingleton<T extends Object> extends Injectable<T> {
  InjectableSingleton(
    T Function() builder, {
    this.lazy = true,
    this.tag,
  }) : super(builder) {
    if (!lazy) {
      retrieve();
    }
  }

  final bool lazy;
  final String? tag;

  T? _instance;

  T retrieve() {
    if (_instance == null) {
      _instance = builder();
      diLog('Created singleton ${T.toString()}');
    }

    diLog('Retrieved singleton ${T.toString()}');

    return _instance!;
  }
}

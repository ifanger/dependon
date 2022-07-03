import 'package:dependon/dependon.dart';
import 'package:dependon/src/models/injectable.dart';

class InjectableFactory<T extends Object> extends Injectable<T> {
  InjectableFactory(T Function() builder) : super(builder);

  T create() {
    diLog('Created factory ${T.toString()}');
    return builder.call();
  }
}

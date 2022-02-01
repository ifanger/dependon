import 'package:dependon/core/model/creation.dart';

class Factory<T> extends Creation<T> {
  Factory(this.initialization);

  final Function() initialization;

  @override
  T get instance {
    return initialization.call();
  }

  @override
  Type get type => T;
}

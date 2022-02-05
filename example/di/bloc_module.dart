import 'package:dependon/dependon.dart';

import '../presentation/home/home_bloc.dart';

class BlocModule extends Module {
  @override
  void dependencies() {
    factori(() => HomeBloc(get()));
  }
}

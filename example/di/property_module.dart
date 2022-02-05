import 'package:dependon/dependon.dart';

import '../data/settings/settings.dart';

class PropertyModule extends Module {
  @override
  void dependencies() {
    property<Settings>(Settings());
  }
}

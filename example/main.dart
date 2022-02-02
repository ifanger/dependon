import 'package:flutter/material.dart';

import 'di/dependency_injection_module.dart';
import 'infrastructure/app.dart';

void main() async {
  final diModule = DependencyInjectionModule();
  diModule.load();

  runApp(myApp);
}

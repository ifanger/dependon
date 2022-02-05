import 'package:dependon/dependon.dart';
import 'package:flutter/material.dart';

import 'di/repository_module.dart';
import 'infrastructure/app.dart';

void main() {
  final di = DependencyInjection.instance;
  di.loadModule(RepositoryModule());

  // etc
  runApp(myApp);
}

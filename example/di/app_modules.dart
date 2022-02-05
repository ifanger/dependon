import 'package:dependon/dependon.dart';

import 'bloc_module.dart';
import 'data_source_module.dart';
import 'property_module.dart';
import 'repository_module.dart';
import 'use_case_module.dart';

final List<Module> appModules = [
  PropertyModule(),
  DataSourceModule(),
  RepositoryModule(),
  UseCaseModule(),
  BlocModule()
];

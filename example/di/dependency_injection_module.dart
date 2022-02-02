import 'package:dependon/core/module.dart';
import 'package:dependon/dependon.dart';

import '../data/settings/settings.dart';
import '../data/user/user_data_source.dart';
import '../data/user/user_data_source_impl.dart';
import '../domain/user/get_user_use_case.dart';
import '../presentation/home/home_bloc.dart';
import '../repository/user/user_repository.dart';
import '../repository/user/user_repository_impl.dart';

class DependencyInjectionModule extends DependOnModule {
  @override
  void dependencies() {
    _infra();
    _dataSources();
    _repositories();
    _useCases();
    _blocs();
  }

  void _infra() {
    factori(() => Settings());
  }

  void _dataSources() {
    factori<UserDataSource>(() => UserDataSourceImpl(get()));
  }

  void _repositories() {
    singleton<UserRepository>(() => UserRepositoryImpl(get()));
  }

  void _useCases() {
    factori(() => GetUserUseCase(get()));
  }

  void _blocs() {
    HomeBloc(get());
  }
}

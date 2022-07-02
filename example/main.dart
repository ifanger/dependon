import 'package:dependon/dependon.dart';

import 'controller/user_controller.dart';
import 'data/repository/user_repository.dart';
import 'data/repository/user_repository_impl.dart';
import 'usecase/user_use_case.dart';

void main() {
  final Dependon di = Dependon.instance;
  di.registerFactory(() => UserUseCase(get()));
  di.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());

  // singletons should always be the last to be declared
  di.registerSingleton(UserController(get()));

  final UserController controller = get();
  controller.showUsers();
}

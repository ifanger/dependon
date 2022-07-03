import 'package:dependon/dependon.dart';

import 'controller/user_controller.dart';
import 'data/repository/user_repository.dart';
import 'data/repository/user_repository_impl.dart';
import 'usecase/user_use_case.dart';

void main() {
  final Dependon di = Dependon.instance;
  di.enableLogging(true);

  di.factory(() => UserUseCase(get()));
  di.singleton<UserRepository>(() => UserRepositoryImpl());

  // non-lazy singletons should always be the last to be declared
  di.singleton(() => UserController(get()), lazy: false);

  final UserController controller = get();
  controller.showUsers();
}

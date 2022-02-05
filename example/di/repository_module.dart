import 'package:dependon/dependon.dart';

import '../repository/user/user_repository.dart';
import '../repository/user/user_repository_impl.dart';

class RepositoryModule extends Module {
  @override
  void dependencies() {
    singleton<UserRepository>(() => UserRepositoryImpl(get()));
  }
}

import 'package:dependon/dependon.dart';

import '../domain/user/get_users_use_case.dart';

class UseCaseModule extends Module {
  @override
  void dependencies() {
    factori(() => GetUsersUseCase(get()));
  }
}

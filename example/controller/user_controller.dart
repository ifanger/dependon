import '../usecase/user_use_case.dart';

class UserController {
  UserController(this._userUseCase);

  final UserUseCase _userUseCase;

  void showUsers() {
    for (final String name in _userUseCase.getUsersList()) {
      print(name);
    }
  }
}

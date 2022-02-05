import 'dart:async';

import '../../domain/user/get_users_use_case.dart';
import '../../repository/user/model/user.dart';

class HomeBloc {
  HomeBloc(this._getUserUseCase) {
    init();
  }

  final GetUsersUseCase _getUserUseCase;

  final StreamController<List<User>?> _userController = StreamController();

  Stream<List<User>?> get userStream => _userController.stream;

  Future<void> init() async {
    _userController.sink.add(null);
    final users = await _getUserUseCase.fetchOrderedUsers();
    _userController.sink.add(users);
  }
}

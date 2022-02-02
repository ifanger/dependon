import '../../repository/user/model/user.dart';
import '../../repository/user/user_repository.dart';

class GetUserUseCase {
  GetUserUseCase(this._userRepository);

  final UserRepository _userRepository;

  Future<List<User>> fetchOrderedUsers() async {
    final users = await _userRepository.fetchUsers();
    users.sort((a, b) => a.age.compareTo(b.age));

    return users;
  }
}

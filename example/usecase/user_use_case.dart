import '../data/repository/user_repository.dart';

class UserUseCase {
  UserUseCase(this._userRepository);

  final UserRepository _userRepository;

  Iterable<String> getUsersList() => _userRepository.getUsersList();
}

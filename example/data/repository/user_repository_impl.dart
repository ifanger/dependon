import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Iterable<String> getUsersList() {
    return [
      'User A',
      'User B',
      'User C',
    ];
  }
}

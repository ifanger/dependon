import 'model/user.dart';

abstract class UserRepository {
  Future<List<User>> fetchUsers();
}

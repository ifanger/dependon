import 'model/user_model.dart';

abstract class UserDataSource {
  Future<List<UserModel>> fetchUsers();
}

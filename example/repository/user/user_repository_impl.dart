import '../../data/user/model/user_model.dart';
import '../../data/user/user_data_source.dart';
import 'model/user.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this._dataSource);

  final UserDataSource _dataSource;

  @override
  Future<List<User>> fetchUsers() async {
    final result = await _dataSource.fetchUsers();

    return result.map((model) => model.toUser()).toList();
  }
}

extension _UserConverter on UserModel {
  User toUser() => User(int.parse(id), name, int.parse(age));
}

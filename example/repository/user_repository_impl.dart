import '../model/user.dart';
import '../provider/user_provider.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this._userProvider);

  final UserProvider _userProvider;

  @override
  Future<User> getUser() {
    return _userProvider.getUser();
  }
}

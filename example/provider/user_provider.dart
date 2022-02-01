import '../model/user.dart';

class UserProvider {
  Future<User> getUser() async {
    Future.delayed(const Duration(milliseconds: 300));
    return User("id", "name", 10);
  }
}

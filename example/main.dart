import 'package:dependon/dependon.dart';

import 'provider/user_provider.dart';
import 'repository/user_repository.dart';
import 'repository/user_repository_impl.dart';

void main() async {
  singleton(() => UserProvider());
  singleton<UserRepository>(() => UserRepositoryImpl(get()));

  final UserRepository userRepository = get();
  final user = await userRepository.getUser();

  print(user.name);
}

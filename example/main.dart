import 'package:dependon/dependon.dart';

import 'provider/user_provider.dart';
import 'repository/user_repository.dart';
import 'repository/user_repository_impl.dart';

void main() async {
  factory(() => UserProvider());
  singleton<UserRepository>(() => UserRepositoryImpl(get()));

  final UserRepository userRepository = get();
  await userRepository.getUser();
}

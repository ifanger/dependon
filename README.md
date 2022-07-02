Simple, light-weight and extremely legible package for dependency injection management.

## Features

- Simple to use
- Light-weight and high compatible
- Keep your code legible

## Getting started

1. Create your dependencies

```dart
import 'package:dependon/dependon.dart';

void main() {
  final Dependon di = Dependon.instance;
  di.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  di.registerFactory(() => UserUseCase(get()));
  di.registerSingleton(UserService(get()));

  runApp(myApp());
}
```

2. Retrieve your dependencies

```dart
import 'package:dependon/dependon.dart';

final UserRepository userRepository = get<UserRepository>();
// or
final UserRepository userRepository = get();
// or
final userRepository = get<UserRepository>();
```

## Additional information

This is an **alpha release** and this package is still in development. **Not recommended** for **
production**.

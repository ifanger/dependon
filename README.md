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
  di.enableLogging(true);

  di.singleton<UserRepository>(() => UserRepositoryImpl());
  di.factory(() => UserUseCase(get()));
  di.singleton(() => UserService(get()), lazy: false);

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

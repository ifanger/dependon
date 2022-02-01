A simple light-weight dependency injection manager for Flutter.

## Features

 - Global dependency injection accross the application.
 - Lazy initialization.
 - Simple and light-weight.
 - Ready-to-go.

## Getting started

1. Add the dependency to your `pubspec.yaml`.
2. Setup your components at the start of your application:
```dart
import 'package:dependon/dependon.dart';

factory(() => UserProvider());
singleton<UserRepository>(() => UserRepositoryImpl(get()));
```
3. Use it wherever you want.
```dart
import 'package:dependon/dependon.dart';

final UserRepository userRepository = get();
// or
final userRepository = get<UserRepository>();
```



## Usage

```dart
import 'package:dependon/dependon.dart';

void main() async {
  factory(() => UserProvider());
  singleton<UserRepository>(() => UserRepositoryImpl(get()));

  // retrieve instance
  final UserRepository userRepository = get();
}
```

## Additional information

This is an **alpha release** and this package is still in development. **Not recommended** for **production**.

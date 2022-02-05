Simple and light-weight package for dependency injection management.

## Features

- Create modules to organize your application's dependencies
- Easy to learn
- Supports Inversion of Control
- Lazy initialization by default

## Getting started

1. Add the dependency to your `pubspec.yaml`.
2. Create your first module

```dart
import 'package:dependon/dependon.dart';

class RepositoryModule extends Module {
  @override
  void dependencies() {
    singleton<UserRepository>(() => UserRepositoryImpl(get()));
  }
}
```

3. Load your module

```dart
import 'package:dependon/dependon.dart';

void main() {
  final di = DependencyInjection.instance;
  di.loadModule(RepositoryModule());
  // ...
  runApp(myApp);
}
```

4. Retrieve your classes

```dart
import 'package:dependon/dependon.dart';

final UserRepository userRepository = get();
```

## Module

A Module is a logical component that organizes and split your concepts behind your application. In a
complex architecture you probabily will need to deal with lots of repositories, use cases,
abstractions, concrete implementations and other lots of challanges. For a better organization, you
can split all those things into Modules.

Let's take a look at this sample:

```dart
import 'package:dependon/dependon.dart';

class RepositoryModule extends Module {
  @override
  void dependencies() {
    singleton<CounterRepository>(() => CounterRepositoryImpl(get()));
  }
}

class UseCaseModule extends Module {
  @override
  void dependencies() {
    factori<IncrementCounterUseCase>(() => IncrementCounterUseCase(get()));
  }
}

void main() {
  DependencyInjection.instance.loadModules([
    RepositoryModule(),
    UseCaseModule(),
  ]);
}
```

## Property

A property is an object that holds an instance of another object. Note that an object is **not**
lazy initialized, because will pass the instance of the object in the declaration's moment.

```dart
import 'package:dependon/dependon.dart';

class SettingsModule extends Module {
  @override
  void dependencies() {
    if (isDebug()) {
      property<WebServiceConfig>(MockWebServiceConfig());
    } else {
      property<WebServiceConfig>(WebServiceConfigImpl());
    }
  }
}
```

## Singleton

In software engineering, the singleton pattern is a software design pattern that restricts the
instantiation of a class to one "single" instance. This is useful when exactly one object is needed
to coordinate actions across the system.
(https://en.wikipedia.org/wiki/Singleton_pattern)

```dart
import 'package:dependon/dependon.dart';

class RepositoryModule extends Module {
  @override
  void dependencies() {
    singleton<CounterRepository>(() => CounterRepositoryImpl(get()));
    singleton<UserRepository>(() => UserRepositoryImpl());
  }
}
```

## Factory

In this case, the `Factory` object holds the instruction of initialization of an object, and each
time `get()` is called a new instance of that object will be created. In our package the
initialization of a factory is using the keyword `factori` and this is because the name `factory` is
already in use by Flutter's core.

```dart
import 'package:dependon/dependon.dart';

class BlocModule extends Module {
  @override
  void dependencies() {
    factori<HomeBloc>(() => HomeBloc(get(), get(), get()));
  }
}
```

## Best pratices

### 1. Avoid using `get()` everywhere in you application.

Instead of using `get()` everytime you need an instance of a class, prefer passing your needs by
constructor. That will help you a lot when you need to write a test.

**Bad:**

```dart
import 'package:dependon/dependon.dart';

class MyUseCase {
  final MyRepository _myRepository = get();
// ...
}
```

**Good:**

```dart
import 'package:dependon/dependon.dart';

class MyUseCase {
  final MyRepository _myRepository;

  MyUseCase(this._myRepository);
}
```

### 2. Respect the conceptual ordering

Almost everything in DependOn is lazy initialized which means that the risk of having an
unneccessary initialization of some object is minimal. But in some cases we need to pass our
properties accross the application, and those properties are not lazy initialized. That means we
must always declare our properties **before** our factories and singletons.

**Bad:**

```dart
import 'package:dependon/dependon.dart';

class AppModule extends Module {
  @override
  void dependencies() {
    singleton<UserRepository>(() => UserRepositoryImpl(get()));
    property<WebServiceConfig>(WebServiceConfigImpl());
  }
}
```

**Good:**

```dart
import 'package:dependon/dependon.dart';

class AppModule extends Module {
  @override
  void dependencies() {
    property<WebServiceConfig>(WebServiceConfigImpl());
    singleton<UserRepository>(() => UserRepositoryImpl(get()));
  }
}
```

## Additional information

This is an **alpha release** and this package is still in development. **Not recommended** for **
production**.

## 1.1.0
- Added `tag` to singleton

## 1.0.0
- Added `remove` method that allows to unregister dependencies
- Added `clear` method for removing all dependencies
- Changed `DependencyInjectionError` in order to throw with a detailed message of the error

## 0.0.7
- Renamed `registerSingleton` to `singleton`
- Renamed `registerFactory` to `factory`
- Added logging support (`enableLogging`)

(internal)
- New folders structure
- We still testing this lib in production apps in order to release an stable version

## 0.0.6

- Refactored all the Dependon library;
- Removed module's support;
- Removed property registration (use singleton instead);
- Simplified library

## 0.0.4

- Removed global `factory` and `singleton` methods. Now your declarations must be inside a `Module`.
- Multiple modules are now supported.
- Added logging feature.
- Added `property` declaration.
- Performance improved.
- Updated documentation.
- Updated `examples/` folder.

## 0.0.3

- Removed createInstance method.
- New feature: module
- `factory` was renamed to `factori` in order to avoid conflicts with the Material's factory.
- Added more code documentation.
- Sample updated.

## 0.0.2

- Removed dependency from collection's package.
- Sample updated.

## 0.0.1

Initial release.
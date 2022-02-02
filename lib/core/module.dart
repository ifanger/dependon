/// Helper class for declaring your dependencies.
///
/// Usage:
/// ```
/// class MyModule extends DependOnModule {
///   @override
///   void dependencies() {
///     singleton<MyRepository>(() => MyRepositoryImpl(get()));
///   }
/// }
/// ```
abstract class DependOnModule {
  /// Dependencies declaration method.
  ///
  /// All dependencies here will be loaded in the memory when [load] is
  /// called.
  ///
  /// Usage:
  /// ```
  /// @override
  /// void dependencies() {
  ///   singleton<MyRepository>(() => MyRepositoryImpl(get()));
  /// }
  /// ```
  void dependencies();

  /// Loads all dependencies declared in [dependencies].
  void load() => dependencies();
}

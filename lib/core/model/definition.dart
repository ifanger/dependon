/// Definition that will be hold on the dependency tree.
abstract class Definition<T> {
  /// Definition's primary type.
  abstract final Type type;

  /// Retrieves an object of [T].
  T get instance;
}

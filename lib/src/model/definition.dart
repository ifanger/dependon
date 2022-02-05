/// Definition that will be hold on the dependency tree.
abstract class Definition<T> {
  /// Definition's primary type.
  abstract final Type type;

  /// Retrieves an object of [T].
  T get instance;

  @override
  int get hashCode => type.hashCode * instance.hashCode;

  @override
  bool operator ==(Object other) {
    return other.hashCode == hashCode;
  }

  @override
  String toString() {
    return "Definition of $type(#$hashCode)";
  }
}

class DependencyError extends Error {
  DependencyError(this.message);

  final String message;

  @override
  String toString() => "DependencyError: $message";
}

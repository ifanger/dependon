/// Wrapper class for [Error].
class DependencyError extends Error {
  DependencyError(this.message);

  /// Error message.
  final String message;

  @override
  String toString() => "DependencyError: $message";
}

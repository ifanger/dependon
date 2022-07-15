class DependencyInjectionError extends Error {
  DependencyInjectionError(this.message);

  final String message;

  @override
  String toString() {
    return 'DependencyInjectionError: $message';
  }
}

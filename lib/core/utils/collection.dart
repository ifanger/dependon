extension CollectionExtension<T> on Iterable<T> {
  /// Retrieves the first element of an [Iterable] or [Null] if no element.
  T? firstWhereOrNull(bool Function(T) test) {
    return cast<T?>().firstWhere((v) => test(v!), orElse: () => null);
  }
}

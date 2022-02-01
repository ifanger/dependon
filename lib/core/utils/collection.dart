extension CollectionExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    return cast<T?>().firstWhere((v) => test(v!), orElse: () => null);
  }
}
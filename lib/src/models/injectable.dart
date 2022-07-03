abstract class Injectable<T extends Object> {
  Injectable(this.builder);

  T Function() builder;
}

extension ObjectX on Object {
  T pipe<T, T1>(T Function(T1) f) => f(this as T1);
}

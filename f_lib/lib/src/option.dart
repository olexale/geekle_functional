abstract class Option<T> {
  const Option();

  B fold<B>(B Function() ifNone, B Function(T) ifSome);

  /// Functor (map function)
  // Option<U> map<U>(U Function(T) f) {
  //   return fold(() => None(), (v) => Some(f(v)));
  // }

  // /// Monad (map function that returns option)
  // Option<U> bind<U>(Option<U> Function(T) f) => flatMap(f);
  // Option<U> flatMap<U>(Option<U> Function(T) f) {
  //   return fold(() => None(), f);
  // }

  // /// Applicative (map option function that returns option)
  // Option<U> ap<U>(Option<U Function(T)> f) {
  //   return fold(
  //     () => None(),
  //     (a) => f.fold(
  //       () => None(),
  //       (ff) => Some(ff(a)),
  //     ),
  //   );
  // }
}

class Some<T> extends Option<T> {
  const Some(this.value);
  final T value;

  @override
  B fold<B>(B Function() ifNone, B Function(T) ifSome) {
    return ifSome(value);
  }

  // @override
  // String toString() {
  //   return 'Some($value)';
  // }
}

class None<T> extends Option<T> {
  @override
  B fold<B>(B Function() ifNone, B Function(T) ifSome) {
    return ifNone();
  }

  // @override
  // String toString() {
  //   return 'None';
  // }
}

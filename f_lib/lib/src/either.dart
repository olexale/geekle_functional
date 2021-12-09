abstract class Either<L, R> {
  const Either();

  B fold<B>(B Function(L) ifLeft, B Function(R) ifRight);

  // /// Functor (map function)
  // Either<L, U> map<U>(U Function(R) f) {
  //   return fold((l) => Left(l), (r) => Right(f(r)));
  // }

  // /// Monad (map function that returns Either)
  // Either<L, U> bind<U>(Either<L, U> Function(R) f) => flatMap(f);
  // Either<L, U> flatMap<U>(Either<L, U> Function(R) f) {
  //   return fold((l) => Left(l), f);
  // }

  // /// Applicative (map Either function that returns Either)
  // Either<L, U> ap<U>(Either<L, U Function(R)> f) {
  //   return fold(
  //     (l) => Left(l),
  //     (a) => f.fold(
  //       (l) => Left(l),
  //       (ff) => Right(ff(a)),
  //     ),
  //   );
  // }
}

class Right<L, R> extends Either<L, R> {
  const Right(this.value);
  final R value;

  @override
  B fold<B>(B Function(L) ifLeft, B Function(R) ifRight) {
    return ifRight(value);
  }

  // @override
  // String toString() {
  //   return 'Right($value)';
  // }
}

class Left<L, R> extends Either<L, R> {
  const Left(this.value);
  final L value;

  @override
  B fold<B>(B Function(L) ifLeft, B Function(R) ifRight) {
    return ifLeft(value);
  }

  // @override
  // String toString() {
  //   return 'Left($value)';
  // }
}

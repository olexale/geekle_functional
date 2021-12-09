class Reader<E, A> {
  const Reader(this.run);

  final A Function(E) run;

  Reader<E, B> flatMap<B>(Reader<E, B> Function(A) f) {
    return Reader(
      (r) => f(run(r)).run(r),
    );
  }
}

import 'package:f_lib/src/either.dart';
import 'package:f_lib/src/task_either.dart';

class IOEither<L, R> {
  const IOEither(this.run);

  final Either<L, R> Function() run;

  factory IOEither.fromPredicate(
    R value,
    bool Function(R a) predicate,
    L Function(R a) onFalse,
  ) =>
      IOEither(() => predicate(value) ? Right(value) : Left(onFalse(value)));

  IOEither<L, C> flatMap<C>(IOEither<L, C> Function(R r) f) => IOEither(
        () => run().fold(
          (l) => Left(l),
          (r) => f(r).run(),
        ),
      );

  TaskEither<L, C> flatMapTask<C>(TaskEither<L, C> Function(R r) f) =>
      TaskEither(
        () => run().fold(
          (l) => Future.value(Left(l)),
          (r) => f(r).run(),
        ),
      );
}

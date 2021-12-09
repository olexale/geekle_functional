import 'package:f_lib/src/either.dart';

class TaskEither<L, R> {
  const TaskEither(this.run);

  final Future<Either<L, R>> Function() run;

  // TaskEither<L, C> flatMap<C>(TaskEither<L, C> Function(R r) f) => TaskEither(
  //       () => run().then(
  //         (value) => value.fold(
  //           (l) => Left(l),
  //           (r) => f(r).run(),
  //         ),
  //       ),
  //     );

  factory TaskEither.tryCatch(
    Future<R> Function() run,
    L Function(Object error, StackTrace stackTrace) onError,
  ) =>
      TaskEither<L, R>(
        () async {
          try {
            final value = await run();
            return Right<L, R>(value);
          } catch (error, stack) {
            return Left<L, R>(onError(error, stack));
          }
        },
      );
}

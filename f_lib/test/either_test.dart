// import 'package:f_lib/either.dart';
// import 'package:f_lib/unit.dart';
// import 'package:test/test.dart';

// void main() {
//   test('Functor', () {
//     const a = Right(5);
//     final b = a.map((p) => p + 3);
//     expect(b.toString(), 'Right(8)');
//   });

//   test('Applicative', () {
//     final plus3 = Right<int, int Function(int)>((x) => x + 3);
//     const b = Right<int, int>(5);
//     final c = b.ap(plus3);
//     expect(c.toString(), 'Right(8)');

//     // curried addition
//     final curriedAddition = (int a) => (int b) => a + b;
//     // int Function(int) Function(int) curriedAddition(a) => (b) => a + b;

//     final res = const Right<Unit, int>(3)
//         .ap(const Right<Unit, int>(5).map(curriedAddition));
//     expect(res.toString(), 'Right(8)');
//   });

//   test('Monad', () {
//     Either<Unit, num> half(num a) =>
//         a % 2 == 0 ? Right(a / 2) : const Left(unit);

//     final a = const Right(5).bind(half);
//     expect(a.toString(), 'Left(())');

//     final b = const Right(20).bind(half).bind(half);
//     expect(b.toString(), 'Right(5.0)');
//   });
// }

// import 'package:f_lib/option.dart';
// import 'package:test/test.dart';

// void main() {
//   test('Functor', () {
//     const a = Some(5);
//     final b = a.map((p) => p + 3);
//     expect(b.toString(), 'Some(8)');
//   });

//   test('Applicative', () {
//     final plus3 = Some((x) => x + 3);
//     const b = Some(5);
//     final c = b.ap(plus3);
//     expect(c.toString(), 'Some(8)');

//     // curried addition
//     final curriedAddition = (int a) => (int b) => a + b;
//     // int Function(int) Function(int) curriedAddition(a) => (b) => a + b;
//     // int Function(int) curriedAddition(a) => (b) => a + b;

//     final res = const Some(3).ap(const Some(5).map(curriedAddition));
//     expect(res.toString(), 'Some(8)');
//   });

//   test('Monad', () {
//     Option<num> half(num a) => a % 2 == 0 ? Some(a / 2) : None();

//     final a = const Some(5).bind(half);
//     expect(a.toString(), 'None');

//     final b = const Some(20).bind(half).bind(half);
//     expect(b.toString(), 'Some(5.0)');
//   });
// }

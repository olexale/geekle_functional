import 'package:f_lib/f_lib.dart';

import 'package:test/test.dart';

void main() {
  test('IOEither.fromPredicate', () {
    final int value = 42;

    final ioeither = IOEither.fromPredicate(
      value,
      (int n) => n >= 42,
      (int n) => 'error $n',
    );
    ioeither.run().fold(
          (e) => fail(e),
          (v) => expect(v, 42),
        );
  });
}

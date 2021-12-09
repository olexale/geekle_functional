import 'package:f_lib/f_lib.dart';

import 'package:test/test.dart';

import 'helper/fun3_gen.dart';
import 'helper/fun_option_gen.dart';
import 'helper/person.dart';

// void getPerson() {
//   try {
//     final person = fun3(1);
//     if (person == null) {
//       return;
//     }
//     print(person.toString());
//   } catch (e) {
//     print(e.toString());
//   }
// }

void main() {
  test('never happens in real-life', () {
    final name = getPerson(1).name;
    expect(name, '1');
  });

  test('almost real-life', () {
    final name = getPerson2(1)?.name;
    expect(name.runtimeType, String);
    expect(name, '1');

    final name2 = getPerson2(2)?.name;
    expect(name2, isNull);
    expect(name2.runtimeType, Null);
  });

  test('real-life (network, db, platform)', () {
    final name = getPerson3(1)?.name;
    expect(name, '1');

    final name2 = getPerson3(2)?.name;
    expect(name2, isNull);
    // if (name != null) {}

    int? a = 42;
    a = null;
    expect(a == name2, isTrue);

    // expect(() => fun3(3)?.name, '3');
    // the solution might be to have exception in the method signature.
    // Dart doesn't support this. (for good)
    // You are forced to catch all exceptions instead of handling them properly.
    expect(() => getPerson3(3), throwsException);

    // One more thing:
    // expect(() => getPerson3(4), throwsException);

    // According to documentation: These are not errors that a caller should expect or catch - if they occur, the program is erroneous, and terminating the program may be the safest response.
    // Do not try to catch errors!
    try {
      getPerson3(4)?.name;
      fail('come on');
    } catch (_) {}
  });

  test('we can not return multiple value. can we? - not the best one solution',
      () {
    // fun1 returns a person
    // Person

    // fun2 returns a (person)
    // Person?

    // how to return a ((person))
    // Person??
    // Maybe<Maybe<Person>>
    // Option<Option<Person>>
    final o = getPerson2Option(41);
    if (o is Some<Person>) {
      expect(o.value.name, '41');
    } else {
      fail('');
    }

    final option = getPerson3Option(41);
    if (option is Some<Option<Option<Person>>>) {
      final v1 = option.value;
      if (v1 is Some<Option<Person>>) {
        final v2 = v1.value;
        if (v2 is Some<Person>) {
          expect(v2.value.name, '41');
        } else {
          fail('1 can not be!');
        }
      } else {
        fail('2 can not be!');
      }
    } else {
      fail('3 can not be!');
    }

    // we can do better with fold!
    option.fold(
      () => fail('id % 3 == 0'),
      (p) => p.fold(
        () => fail('id % 2 == 0'),
        (p) => p.fold(
          () => fail('id == 4'),
          (p) => expect(p.name, '41'),
        ),
      ),
    );
  });

  test('we can return multiple values.', () {
    final either = getPerson3Either(41);

    either.fold(
      (e) => fail('should not happen'),
      (p) => expect(p.name, '41'),
    );
  });
}

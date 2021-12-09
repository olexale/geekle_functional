import 'person.dart';

Person? getPerson3(int id) {
  if (id == 4) {
    throw Error();
  }
  if (id % 2 == 0) {
    return null;
  }
  if (id % 3 == 0) {
    throw Exception('why? because I can!');
  }
  return Person(id.toString());
}

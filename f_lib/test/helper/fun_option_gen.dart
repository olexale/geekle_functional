import 'package:f_lib/f_lib.dart';

import 'person.dart';

Option<Person> getPerson2Option(int id) {
  if (id % 2 == 0) {
    return None();
  }
  return Some(Person(id.toString()));
}

Option<Option<Option<Person>>> getPerson3Option(int id) {
  if (id == 4) {
    return None();
  }
  if (id % 2 == 0) {
    return Some(None());
  }
  if (id % 3 == 0) {
    return Some(Some(None()));
  }
  return Some(Some(Some(Person(id.toString()))));
}

Either<Exception, Person> getPerson3Either(int id) {
  if (id % 2 == 0) {
    return Left(Exception('Should not divide by 2'));
  }
  if (id % 3 == 0) {
    return Left(Exception('why? because I can!'));
  }
  if (id == 1) {
    throw Left(Error());
  }
  return Right(Person(id.toString()));
}

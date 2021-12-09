class Person {
  Person(this.name);

  final String name;
}

Person getPerson(int id) {
  return Person(id.toString());
}

Person? getPerson2(int id) {
  if (id % 2 == 0) {
    return null;
  }
  return Person(id.toString());
}

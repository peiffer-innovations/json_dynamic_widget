import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'person.dart';

class TeamWidget extends StatelessWidget {
  final Person person;
  final Person? nullablePerson;
  final Person? nullableDefaultPerson;
  final List<Person> personList;
  final Set<Person> personSet;
  final int someNumber;
  final String someString;

  const TeamWidget({
    super.key,
    required this.person,
    required this.personList,
    required this.personSet,
    this.nullablePerson,
    this.nullableDefaultPerson = const Person(firstName: 'Max'),
    required this.someNumber,
    required this.someString,
  });

  @override
  Widget build(BuildContext context) {
    return Text('${person.firstName} - $someNumber');
  }
}

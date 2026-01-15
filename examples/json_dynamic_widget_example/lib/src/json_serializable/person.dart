import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  const Person({
    required this.firstName,
    this.lastName = 'LastName',
    this.dateOfBirth,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  final String firstName, lastName;

  final DateTime? dateOfBirth;

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@JsonEnum(alwaysCreate: true)
enum PersonType {
  @JsonValue('CALM')
  calm,
  @JsonValue('CURIOUS')
  curious,
  unknown;

  factory PersonType.fromJson(String json) =>
      $enumDecode(_$PersonTypeEnumMap, json, unknownValue: PersonType.unknown);

  String toJson() => _$PersonTypeEnumMap[this]!;
}

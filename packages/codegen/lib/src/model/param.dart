import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';

class Param {
  const Param({
    this.custom = true,
    this.defaultValueCode,
    required this.displayName,
    this.isBuilderParam = false,
    required this.isRequired,
    required this.typeName,
    required this.type,
    this.typeNullable = false,
  });

  factory Param.fromFormalParameter(
    FormalParameterElement param, {
    required TypeChecker builderParamChecker,
  }) => Param(
    custom: false,
    defaultValueCode: param.defaultValueCode,
    displayName: param.name!,
    isBuilderParam: builderParamChecker.annotationsOf(param).isNotEmpty,
    isRequired: param.isRequired,
    typeName: param.type.getDisplayString(),
    typeNullable: param.type.nullabilitySuffix == NullabilitySuffix.question,
    type: param.type,
  );

  final bool custom;
  final String? defaultValueCode;
  final String displayName;
  final bool isBuilderParam;
  final bool isRequired;
  final String typeName;
  final bool typeNullable;
  final DartType type;
}

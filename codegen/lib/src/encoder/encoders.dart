import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:json_theme/codegen.dart';

typedef ParameterEncoder = String Function(
  ParameterElement element, {
  required String name,
});

final kEncoders = <String, ParameterEncoder>{
  'bool': (
    ParameterElement element, {
    required String name,
  }) =>
      name,
  'double': (
    element, {
    required String name,
  }) =>
      name,
  'int': (
    element, {
    required String name,
  }) =>
      name,
  'Curve': (
    element, {
    required String name,
  }) =>
      'CurvesValues.encode($name)',
  'DateTime': (
    element, {
    required String name,
  }) =>
      element.type.nullable
          ? '$name?.millisecondsSinceEpoch'
          : '$name.millisecondsSinceEpoch',
  'Duration': (
    element, {
    required String name,
  }) =>
      element.type.nullable ? '$name?.inMilliseconds' : '$name.inMilliseconds',
  'List<double>': (
    element, {
    required String name,
  }) =>
      name,
  'List<int>': (
    element, {
    required String name,
  }) =>
      name,
  'List<JsonWidgetData>': (element, {required String name}) =>
      element.type.nullable
          ? 'JsonClass.maybeToJsonList($name)'
          : 'JsonClass.toJsonList($name)',
  'List<PreferredSizeWidget>': (element, {required String name}) =>
      element.type.nullable
          ? 'JsonClass.maybeToJsonList($name)'
          : 'JsonClass.toJsonList($name)',
  'List<Widget>': (element, {required String name}) => element.type.nullable
      ? 'JsonClass.maybeToJsonList($name)'
      : 'JsonClass.toJsonList($name)',
  'JsonWidgetData': (element, {required String name}) =>
      element.type.nullable ? '$name?.toJson()' : '$name.toJson()',
  'PreferredSizeWidget': (element, {required String name}) =>
      element.type.nullable ? '$name?.toJson()' : '$name.toJson()',
  'String': (element, {required String name}) => name,
  'Widget': (element, {required String name}) =>
      element.type.nullable ? '$name?.toJson()' : '$name.toJson()',
  ...kThemeEncoders.map(
    (key, value) => MapEntry<String, ParameterEncoder>(
      key,
      (
        element, {
        required String name,
      }) =>
          '$value($name,)',
    ),
  ),
};

String encode(
  ClassElement classElement,
  ParameterElement element, {
  required Map<String, String> aliases,
  required Map<String, String> defaults,
}) {
  final displayName = element.name;
  final name = aliases[element.name] ?? element.name;

  final typeStr = element.type.getDisplayString(withNullability: false);

  final encoder = kEncoders[typeStr];
  var result = displayName;

  if (encoder != null) {
    result = encoder(
      element,
      name: displayName,
    );
  }

  final defaultValueCode = defaults[name] ?? element.defaultValueCode;

  return '''
  '${element.name}': ${defaultValueCode == null ? result : '$defaultValueCode == $displayName ? null : $result'},
''';
}

extension DartTypeNullable on DartType {
  bool get nullable => nullabilitySuffix == NullabilitySuffix.question;
}

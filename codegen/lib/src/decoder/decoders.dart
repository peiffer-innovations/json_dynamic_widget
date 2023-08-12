import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:json_theme/codegen.dart';

typedef ParameterDecoder = String Function(
  ParameterElement element, {
  required String name,
});

final kDecoders = <String, ParameterDecoder>{
  'bool': (
    ParameterElement element, {
    required String name,
  }) =>
      element.type.nullable
          ? "JsonClass.maybeParseBool(map['$name'],)"
          : "JsonClass.parseBool(map['$name'], whenNull: ${element.defaultValueCode ?? false},)",
  'double': (
    element, {
    required String name,
  }) =>
      _defaultDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonClass.maybeParseDouble'
            : 'JsonClass.parseDouble',
      ),
  'int': (
    element, {
    required String name,
  }) =>
      _defaultDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonClass.maybeParseInt'
            : 'JsonClass.parseInt',
      ),
  'Curve': (
    element, {
    required String name,
  }) =>
      _defaultDecoder(element, name, 'CurvesValues.lookup'),
  'DateTime': (
    element, {
    required String name,
  }) =>
      _defaultDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonClass.maybeParseDateTime'
            : 'JsonClass.parseDateTime',
      ),
  'Duration': (
    element, {
    required String name,
  }) =>
      _defaultDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonClass.maybeParseDurationFromMillis'
            : 'JsonClass.parseDurationFromMillis',
      ),
  'List<double>': (
    element, {
    required String name,
  }) =>
      _defaultDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonClass.maybeParseDoubleList'
            : 'JsonClass.parseDoubleList',
      ),
  'List<int>': (
    element, {
    required String name,
  }) =>
      _defaultDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonClass.maybeParseIntList'
            : 'JsonClass.parseIntList',
      ),
  'List<JsonWidgetData>': (element, {required String name}) => _widgetDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonWidgetData.maybeFromDynamicList'
            : 'JsonWidgetData.fromDynamicList',
      ),
  'List<PreferredSizeWidget>': (element, {required String name}) =>
      _widgetDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonWidgetData.maybeFromDynamicList'
            : 'JsonWidgetData.fromDynamicList',
      ),
  'List<Widget>': (element, {required String name}) => _widgetDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonWidgetData.maybeFromDynamicList'
            : 'JsonWidgetData.fromDynamicList',
      ),
  'JsonWidgetData': (element, {required String name}) => _widgetDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonWidgetData.maybeFromDynamic'
            : 'JsonWidgetData.fromDynamic',
      ),
  'PreferredSizeWidget': (element, {required String name}) => _widgetDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonWidgetData.maybeFromDynamic'
            : 'JsonWidgetData.fromDynamic',
      ),
  'String': (element, {required String name}) =>
      "map['$name'] ${element.defaultValueCode == null ? '' : ' ?? ${element.defaultValueCode}'}",
  'Widget': (element, {required String name}) => _widgetDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonWidgetData.maybeFromDynamic'
            : 'JsonWidgetData.fromDynamic',
      ),
  ...kThemeDecoders.map((key, value) => MapEntry<String, ParameterDecoder>(
      key,
      (
        element, {
        required String name,
      }) =>
          _themeDecoder(element, name, value))),
};

String decode(
  ClassElement classElement,
  ParameterElement element, {
  required Map<String, String> aliases,
  required Iterable<String> paramDecoders,
}) {
  final name = aliases[element.name] ?? element.name;
  var result = "map['$name']";

  final typeStr = element.type.getDisplayString(withNullability: false);

  var decoded = false;
  if (paramDecoders.contains(name)) {
    decoded = true;
  }

  if (!decoded) {
    final decoder = kDecoders[typeStr];

    if (decoder != null) {
      result = decoder(
        element,
        name: name,
      );
    }
  }

  return result;
}

String _defaultDecoder(ParameterElement element, String name, String funName) {
  var defaultValue = element.defaultValueCode;

  if (defaultValue != null) {
    if (element.type.getDisplayString(withNullability: false) == 'double') {
      if (int.tryParse(defaultValue) != null) {
        defaultValue = '$defaultValue.0';
      }
    }
  }

  return '''
() {
  dynamic parsed = $funName(map['$name']);
  ${defaultValue == null ? '' : 'parsed ??= $defaultValue;'}
  ${!element.type.nullable && defaultValue == null ? "if (parsed == null) { throw Exception('Null value encountered for required parameter: [$name].'); }" : ''}
  return parsed;
}()
''';
}

String _themeDecoder(ParameterElement element, String name, String funName) =>
    '''
() {
  dynamic parsed = $funName(map['$name'], validate: false,);
  ${element.defaultValueCode == null ? '' : 'parsed ??= ${element.defaultValueCode};'}
  ${!element.type.nullable && element.defaultValueCode == null ? "if (parsed == null) { throw Exception('Null value encountered for required parameter: [$name].'); }" : ''}
  return parsed;
}()
''';

String _widgetDecoder(ParameterElement element, String name, String funName) =>
    '''
() {
  dynamic parsed = $funName(map['$name'], registry: registry,);
  ${element.defaultValueCode == null ? '' : 'parsed ??= ${element.defaultValueCode!.replaceAll('PreferredSizeWidget', 'JsonWidgetData').replaceAll('Widget', 'JsonWidgetData')};'}

  
  ${!element.type.nullable && element.defaultValueCode == null ? "if (parsed == null) { throw Exception('Null value encountered for required parameter: [$name].'); }" : ''}
  return parsed;
}()
''';

extension DartTypeNullable on DartType {
  bool get nullable => nullabilitySuffix == NullabilitySuffix.question;
}

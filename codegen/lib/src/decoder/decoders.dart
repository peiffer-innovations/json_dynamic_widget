import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:json_theme/codegen.dart';

typedef ParameterDecoder = String Function(
  ParameterElement element, {
  required String? defaultValueCode,
  required String name,
});

final kDecoders = <String, ParameterDecoder>{
  'bool': (
    ParameterElement element, {
    required String? defaultValueCode,
    required String name,
  }) =>
      element.type.nullable
          ? "JsonClass.maybeParseBool(map['$name'],)"
          : "JsonClass.parseBool(map['$name'], whenNull: ${defaultValueCode ?? false},)",
  'double': (
    element, {
    required String? defaultValueCode,
    required String name,
  }) =>
      _defaultDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonClass.maybeParseDouble'
            : 'JsonClass.parseDouble',
        defaultValueCode,
      ),
  'int': (
    element, {
    required String? defaultValueCode,
    required String name,
  }) =>
      _defaultDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonClass.maybeParseInt'
            : 'JsonClass.parseInt',
        defaultValueCode,
      ),
  'Curve': (
    element, {
    required String? defaultValueCode,
    required String name,
  }) =>
      _defaultDecoder(
        element,
        name,
        'CurvesValues.lookup',
        defaultValueCode,
      ),
  'DateTime': (
    element, {
    required String? defaultValueCode,
    required String name,
  }) =>
      _defaultDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonClass.maybeParseDateTime'
            : 'JsonClass.parseDateTime',
        defaultValueCode,
      ),
  'Duration': (
    element, {
    required String? defaultValueCode,
    required String name,
  }) =>
      _defaultDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonClass.maybeParseDurationFromMillis'
            : 'JsonClass.parseDurationFromMillis',
        defaultValueCode,
      ),
  'List<double>': (
    element, {
    required String? defaultValueCode,
    required String name,
  }) =>
      _defaultDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonClass.maybeParseDoubleList'
            : 'JsonClass.parseDoubleList',
        defaultValueCode,
      ),
  'List<int>': (
    element, {
    required String? defaultValueCode,
    required String name,
  }) =>
      _defaultDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonClass.maybeParseIntList'
            : 'JsonClass.parseIntList',
        defaultValueCode,
      ),
  'List<JsonWidgetData>': (
    element, {
    required String? defaultValueCode,
    required String name,
  }) =>
      _widgetDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonWidgetData.maybeFromDynamicList'
            : 'JsonWidgetData.fromDynamicList',
        defaultValueCode,
      ),
  'List<PreferredSizeWidget>': (
    element, {
    required String? defaultValueCode,
    required String name,
  }) =>
      _widgetDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonWidgetData.maybeFromDynamicList'
            : 'JsonWidgetData.fromDynamicList',
        defaultValueCode,
      ),
  'List<Widget>': (
    element, {
    required String? defaultValueCode,
    required String name,
  }) =>
      _widgetDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonWidgetData.maybeFromDynamicList'
            : 'JsonWidgetData.fromDynamicList',
        defaultValueCode,
      ),
  'JsonWidgetData': (
    element, {
    required String? defaultValueCode,
    required String name,
  }) =>
      _widgetDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonWidgetData.maybeFromDynamic'
            : 'JsonWidgetData.fromDynamic',
        defaultValueCode,
      ),
  'PreferredSizeWidget': (
    element, {
    required String? defaultValueCode,
    required String name,
  }) =>
      _widgetDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonWidgetData.maybeFromDynamic'
            : 'JsonWidgetData.fromDynamic',
        defaultValueCode,
      ),
  'String': (
    element, {
    required String? defaultValueCode,
    required String name,
  }) =>
      "map['$name'] ${defaultValueCode == null ? '' : ' ?? $defaultValueCode'}",
  'Widget': (
    element, {
    required String? defaultValueCode,
    required String name,
  }) =>
      _widgetDecoder(
        element,
        name,
        (element.type.nullable || element.defaultValueCode != null)
            ? 'JsonWidgetData.maybeFromDynamic'
            : 'JsonWidgetData.fromDynamic',
        defaultValueCode,
      ),
  ...kThemeDecoders.map((key, value) => MapEntry<String, ParameterDecoder>(
      key,
      (
        element, {
        required String? defaultValueCode,
        required String name,
      }) =>
          _themeDecoder(
            element,
            name,
            value,
            defaultValueCode,
          ))),
};

String decode(
  ClassElement classElement,
  ParameterElement element, {
  required Map<String, String> aliases,
  required Map<String, String> defaults,
  required Iterable<String> paramDecoders,
}) {
  final name = aliases[element.name] ?? element.name;
  var defaultValueCode = defaults[name] ??
      (paramDecoders.contains(name) ? null : element.defaultValueCode);
  if (defaultValueCode != null) {
    if (defaultValueCode == 'null') {
      defaultValueCode = null;
    } else if (element.type.getDisplayString(withNullability: false) ==
        'double') {
      if (int.tryParse(defaultValueCode) != null) {
        defaultValueCode = '$defaultValueCode.0';
      }
    }
  }
  var result =
      "map['$name']${defaultValueCode == null ? '' : '?? $defaultValueCode'}";

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
        defaultValueCode: defaultValueCode,
        name: name,
      );
    }
  }

  return result;
}

String _defaultDecoder(
  ParameterElement element,
  String name,
  String funName,
  String? defaultValueCode,
) {
  return '''
() {
  dynamic parsed = $funName(map['$name']);
  ${defaultValueCode == null ? '' : 'parsed ??= $defaultValueCode;'}
  ${!element.type.nullable && defaultValueCode == null ? "if (parsed == null) { throw Exception('Null value encountered for required parameter: [$name].'); }" : ''}
  return parsed;
}()
''';
}

String _themeDecoder(
  ParameterElement element,
  String name,
  String funName,
  String? defaultValueCode,
) {
  return '''
() {
  dynamic parsed = $funName(map['$name'], validate: false,);
  ${defaultValueCode == null ? '' : 'parsed ??= $defaultValueCode;'}
  ${!element.type.nullable && defaultValueCode == null ? "if (parsed == null) { throw Exception('Null value encountered for required parameter: [$name].'); }" : ''}
  return parsed;
}()
''';
}

String _widgetDecoder(
  ParameterElement element,
  String name,
  String funName,
  String? defaultValueCode,
) =>
    '''
() {
  dynamic parsed = $funName(map['$name'], registry: registry,);
  ${defaultValueCode == null ? '' : 'parsed ??= ${defaultValueCode.replaceAll('PreferredSizeWidget', 'JsonWidgetData').replaceAll('Widget', 'JsonWidgetData')};'}

  
  ${!element.type.nullable && element.defaultValueCode == null ? "if (parsed == null) { throw Exception('Null value encountered for required parameter: [$name].'); }" : ''}
  return parsed;
}()
''';

extension DartTypeNullable on DartType {
  bool get nullable => nullabilitySuffix == NullabilitySuffix.question;
}

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:json_dynamic_widget_codegen/src/model/param.dart';
import 'package:json_theme/codegen.dart';

typedef ParameterDecoder =
    String Function(
      Param element, {
      required String? defaultValueCode,
      required String name,
    });

final kDecoders = <String, ParameterDecoder>{
  'bool': (element, {String? defaultValueCode, required String name}) =>
      element.typeNullable
      ? "JsonClass.maybeParseBool(map['$name'],)"
      : "JsonClass.parseBool(map['$name'], whenNull: ${defaultValueCode ?? false},)",
  'double':
      (element, {required String? defaultValueCode, required String name}) =>
          _defaultDecoder(
            element,
            name,
            (element.typeNullable || element.defaultValueCode != null)
                ? 'JsonClass.maybeParseDouble'
                : 'JsonClass.parseDouble',
            defaultValueCode,
          ),
  'int': (element, {required String? defaultValueCode, required String name}) =>
      _defaultDecoder(
        element,
        name,
        (element.typeNullable || element.defaultValueCode != null)
            ? 'JsonClass.maybeParseInt'
            : 'JsonClass.parseInt',
        defaultValueCode,
      ),
  'Curve':
      (element, {required String? defaultValueCode, required String name}) =>
          _defaultDecoder(
            element,
            name,
            'CurvesValues.lookup',
            defaultValueCode,
          ),
  'DateTime':
      (element, {required String? defaultValueCode, required String name}) =>
          _defaultDecoder(
            element,
            name,
            (element.typeNullable || element.defaultValueCode != null)
                ? 'JsonClass.maybeParseDateTime'
                : 'JsonClass.parseDateTime',
            defaultValueCode,
          ),
  'Duration':
      (element, {required String? defaultValueCode, required String name}) =>
          _defaultDecoder(
            element,
            name,
            (element.typeNullable || element.defaultValueCode != null)
                ? 'JsonClass.maybeParseDurationFromMillis'
                : 'JsonClass.parseDurationFromMillis',
            defaultValueCode,
          ),
  'List<double>':
      (element, {required String? defaultValueCode, required String name}) =>
          _defaultDecoder(
            element,
            name,
            (element.typeNullable || element.defaultValueCode != null)
                ? 'JsonClass.maybeParseDoubleList'
                : 'JsonClass.parseDoubleList',
            defaultValueCode,
          ),
  'List<int>':
      (element, {required String? defaultValueCode, required String name}) =>
          _defaultDecoder(
            element,
            name,
            (element.typeNullable || element.defaultValueCode != null)
                ? 'JsonClass.maybeParseIntList'
                : 'JsonClass.parseIntList',
            defaultValueCode,
          ),
  'List<JsonWidgetData>':
      (element, {required String? defaultValueCode, required String name}) =>
          _widgetDecoder(
            element,
            name,
            (element.typeNullable || element.defaultValueCode != null)
                ? 'JsonWidgetData.maybeFromDynamicList'
                : 'JsonWidgetData.fromDynamicList',
            defaultValueCode,
          ),
  'List<PreferredSizeWidget>':
      (element, {required String? defaultValueCode, required String name}) =>
          _widgetDecoder(
            element,
            name,
            (element.typeNullable || element.defaultValueCode != null)
                ? 'JsonWidgetData.maybeFromDynamicList'
                : 'JsonWidgetData.fromDynamicList',
            defaultValueCode,
          ),
  'List<Widget>':
      (element, {required String? defaultValueCode, required String name}) =>
          _widgetDecoder(
            element,
            name,
            (element.typeNullable || element.defaultValueCode != null)
                ? 'JsonWidgetData.maybeFromDynamicList'
                : 'JsonWidgetData.fromDynamicList',
            defaultValueCode,
          ),
  'JsonWidgetData':
      (element, {required String? defaultValueCode, required String name}) =>
          _widgetDecoder(
            element,
            name,
            (element.typeNullable || element.defaultValueCode != null)
                ? 'JsonWidgetData.maybeFromDynamic'
                : 'JsonWidgetData.fromDynamic',
            defaultValueCode,
          ),
  'PreferredSizeWidget':
      (element, {required String? defaultValueCode, required String name}) =>
          _widgetDecoder(
            element,
            name,
            (element.typeNullable || element.defaultValueCode != null)
                ? 'JsonWidgetData.maybeFromDynamic'
                : 'JsonWidgetData.fromDynamic',
            defaultValueCode,
          ),
  'String': (element, {required String? defaultValueCode, required String name}) =>
      "map['$name'] ${defaultValueCode == null ? '' : ' ?? $defaultValueCode'}",
  'Widget':
      (element, {required String? defaultValueCode, required String name}) =>
          _widgetDecoder(
            element,
            name,
            (element.typeNullable || element.defaultValueCode != null)
                ? 'JsonWidgetData.maybeFromDynamic'
                : 'JsonWidgetData.fromDynamic',
            defaultValueCode,
          ),
  ...kThemeDecoders.map(
    (key, value) => MapEntry<String, ParameterDecoder>(
      key,
      (element, {required String? defaultValueCode, required String name}) =>
          _themeDecoder(element, name, value, defaultValueCode),
    ),
  ),
};

String decode(
  ClassElement classElement,
  Param element, {
  required Map<String, String> aliases,
  required Map<String, String> defaults,
  required Iterable<String> paramDecoders,
  bool parseJsonSerializable = false,
}) {
  final name = aliases[element.displayName] ?? element.displayName;
  var defaultValueCode =
      defaults[name] ??
      (paramDecoders.contains(name) ? null : element.defaultValueCode);
  if (defaultValueCode != null) {
    if (defaultValueCode == 'null') {
      defaultValueCode = null;
    } else if (element.typeName.replaceAll('?', '') == 'double') {
      if (int.tryParse(defaultValueCode) != null) {
        defaultValueCode = '$defaultValueCode.0';
      }
    }
  }
  final attr = "map['$name']";
  final result =
      "$attr${defaultValueCode == null ? '' : ' ?? $defaultValueCode'}";

  final typeStr = element.typeName.replaceAll('?', '');

  var decoded = false;
  if (paramDecoders.contains(name)) {
    decoded = true;
  }

  if (!decoded) {
    final decoder = kDecoders[typeStr];

    if (decoder != null) {
      return decoder(element, defaultValueCode: defaultValueCode, name: name);
    }
  }

  if (parseJsonSerializable) {
    final serializableElementType = element.type;
    final serializableElement = serializableElementType.element;
    final nullablePrefix = element.typeNullable
        ? '$attr == null ? null : '
        : '';
    if (serializableElement is ClassElement) {
      if (serializableElement.constructors.any((c) => c.name == 'fromJson')) {
        return '$nullablePrefix${serializableElement.name}.fromJson($attr)';
      } else if (serializableElementType is InterfaceType) {
        if (serializableElementType.typeArguments.isNotEmpty) {
          if (serializableElement.interfaces.any((interf) =>
          interf.element.name == 'Iterable')) {
            final itemType = serializableElementType.typeArguments.first;
            final itemSerializableElement = itemType.element;
            if (itemSerializableElement is ClassElement &&
                itemSerializableElement.constructors.any((c) =>
                c.name ==
                    'fromJson')) {
              var mapTo = '';
              if (serializableElementType.element.name == 'List') {
                mapTo = '.toList()';
              } else if (serializableElementType.element.name == 'Set') {
                mapTo = '.toSet()';
              }
              final nullableOperator = element.typeNullable ? '?' : '';
              return '$attr$nullableOperator.map<${itemSerializableElement
                  .name}>((e) => ${itemSerializableElement
                  .name}.fromJson(e))$mapTo';
            }
          }
        }
      }
    } else if (serializableElement is EnumElement) {
      if (serializableElement.constructors.any((c) => c.name == 'fromJson')) {
        return '$nullablePrefix${serializableElement.name}.fromJson($attr)';
      }
    }
  }

  return result;
}

String _defaultDecoder(
  Param element,
  String name,
  String funName,
  String? defaultValueCode,
) {
  return '''
() {
  dynamic parsed = $funName(map['$name']);

  ${element.typeNullable && defaultValueCode != null ? '''
  if (!map.containsKey('$name')) {
    parsed ??= $defaultValueCode;
  }
''' : '''
    ${defaultValueCode == null ? '' : 'parsed ??= $defaultValueCode;'}
'''}
  ${!element.typeNullable && defaultValueCode == null ? "if (parsed == null) { throw Exception('Null value encountered for required parameter: [$name].',); }" : ''}
  return parsed;
}()
''';
}

String _themeDecoder(
  Param element,
  String name,
  String funName,
  String? defaultValueCode,
) {
  return '''
() {
  dynamic parsed = $funName(map['$name'], validate: false,);
  ${element.typeNullable && defaultValueCode != null ? '''
  if (!map.containsKey('$name')) {
    parsed ??= $defaultValueCode;
  }
''' : '''
    ${defaultValueCode == null ? '' : 'parsed ??= $defaultValueCode;'}
'''}
  ${!element.typeNullable && defaultValueCode == null ? "if (parsed == null) { throw Exception('Null value encountered for required parameter: [$name].',); }" : ''}
  return parsed;
}()
''';
}

String _widgetDecoder(
  Param element,
  String name,
  String funName,
  String? defaultValueCode,
) =>
    '''
() {
  dynamic parsed = $funName(map['$name'], registry: registry,);
  ${defaultValueCode == null ? '' : 'parsed ??= ${defaultValueCode.replaceAll('PreferredSizeWidget', 'JsonWidgetData').replaceAll('Widget', 'JsonWidgetData')};'}

  
  ${!element.typeNullable && element.defaultValueCode == null ? "if (parsed == null) { throw Exception('Null value encountered for required parameter: [$name].'); }" : ''}
  return parsed;
}()
''';

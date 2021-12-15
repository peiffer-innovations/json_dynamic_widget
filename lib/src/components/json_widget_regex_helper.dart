import 'package:meta/meta.dart';

@immutable
class JsonWidgetRegexHelper {
  JsonWidgetRegexHelper._();

  static final dynamicVarRegex = RegExp(r'^\{\{\s*\S*\s*\}\}$');
  static final functionRegex = RegExp(r'^##([^(]*)\s*(\(.*\))##$');
  static final varRegex = RegExp(r'^!?\{\{\s*\S*\s*\}\}$');

  static List<JsonWidgetParams>? parse(String? data) {
    List<JsonWidgetParams>? params;
    if (data?.isNotEmpty == true) {
      params = [];

      var funName = functionRegex.firstMatch(data!)?.group(1);
      if (funName?.isNotEmpty == true) {
        var originalFun = data;
        data = functionRegex.firstMatch(data)?.group(2);

        params.add(JsonWidgetParams(
          isFunction: true,
          key: funName,
          originalValue: originalFun,
        ));

        var strParams = data!.substring(1, data.length - 1).split(',');
        for (var strParam in strParams) {
          strParam = strParam.trim();
          if (strParam.startsWith('!{{') && strParam.endsWith('}}')) {
            params.add(
              JsonWidgetParams(
                isStatic: true,
                isVariable: true,
                key: strParam.substring(3, strParam.length - 2).trim(),
                originalValue: strParam,
              ),
            );
          } else if (strParam.contains(':!{{') && strParam.endsWith('}}')) {
            var idx = strParam.indexOf(':!{{');
            params.add(
              JsonWidgetParams(
                isNamedVariable: true,
                isStatic: true,
                isVariable: true,
                key: strParam.substring(idx + 4, strParam.length - 2).trim(),
                originalValue: strParam,
              ),
            );
          } else if (strParam.startsWith('{{') && strParam.endsWith('}}')) {
            params.add(
              JsonWidgetParams(
                isVariable: true,
                key: strParam.substring(2, strParam.length - 2).trim(),
                originalValue: strParam,
              ),
            );
          } else if (strParam.contains(':{{') && strParam.endsWith('}}')) {
            var idx = strParam.indexOf(':{{');
            params.add(
              JsonWidgetParams(
                isNamedVariable: true,
                isVariable: true,
                key: strParam.substring(idx + 3, strParam.length - 2).trim(),
                originalValue: strParam,
              ),
            );
          } else {
            params.add(JsonWidgetParams(
              key: strParam,
              originalValue: strParam,
            ));
          }
        }
      } else {
        var group = varRegex.stringMatch(data);
        if (group?.isNotEmpty == true) {
          params.add(
            JsonWidgetParams(
              isStatic: group!.startsWith('!'),
              isVariable: true,
              key: group
                  .substring(group.startsWith('!') ? 3 : 2, group.length - 2)
                  .trim(),
              originalValue: group,
            ),
          );
        } else {
          params.add(JsonWidgetParams(
            key: data,
            originalValue: data,
          ));
        }
      }
    }

    return params;
  }
}

@immutable
class JsonWidgetParams {
  JsonWidgetParams({
    this.isDeferred = false,
    this.isFunction = false,
    this.isNamedVariable = false,
    this.isStatic = false,
    this.isVariable = false,
    this.key,
    required this.originalValue,
  });

  final bool isDeferred;
  final bool isFunction;
  final bool isNamedVariable;
  final bool isStatic;
  final bool isVariable;
  final String? key;
  final String originalValue;

  @override
  bool operator ==(other) {
    var result = false;
    if (other is JsonWidgetParams) {
      result = true;
      result = result && isDeferred == other.isDeferred;
      result = result && isFunction == other.isFunction;
      result = result && isNamedVariable == other.isNamedVariable;
      result = result && isStatic == other.isStatic;
      result = result && isVariable == other.isVariable;
      result = result && key == other.key;
      result = result && originalValue == other.originalValue;
    }

    return result;
  }

  @override
  int get hashCode =>
      '$key.$isDeferred.$isFunction.$isNamedVariable.$isStatic.$isVariable.$originalValue'
          .hashCode;

  @override
  String toString() =>
      'JsonWidgetParams{isDeferred: $isDeferred, isFunction: $isFunction, isNamedVariable: $isNamedVariable, isStatic: $isStatic, isVariable: $isVariable, key: "$key", originalValue: "$originalValue"}';
}

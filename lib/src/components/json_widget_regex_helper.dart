import 'package:meta/meta.dart';

@immutable
class JsonWidgetRegexHelper {
  JsonWidgetRegexHelper._();

  static final dynamicVarRegex = RegExp(r'^\{\{\s*\S*\s*\}\}$');
  static final functionRegex = RegExp(r'^##(\S*)\s*(\(.*\))##$');
  static final varRegex = RegExp(r'^!?\{\{\s*\S*\s*\}\}$');

  static List<JsonWidgetParams>? parse(String? data) {
    List<JsonWidgetParams>? params;
    if (data?.isNotEmpty == true) {
      params = [];

      var funName = functionRegex.firstMatch(data!)?.group(1);
      if (funName?.isNotEmpty == true) {
        data = functionRegex.firstMatch(data)?.group(2);

        params.add(JsonWidgetParams(
          isFunction: true,
          key: funName,
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
              ),
            );
          } else if (strParam.startsWith('{{') && strParam.endsWith('}}')) {
            params.add(
              JsonWidgetParams(
                isVariable: true,
                key: strParam.substring(2, strParam.length - 2).trim(),
              ),
            );
          } else {
            params.add(JsonWidgetParams(key: strParam.trim()));
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
            ),
          );
        } else {
          params.add(JsonWidgetParams(key: data));
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
    this.isStatic = false,
    this.isVariable = false,
    this.key,
  });

  final bool isDeferred;
  final bool isFunction;
  final bool isStatic;
  final bool isVariable;
  final String? key;

  @override
  bool operator ==(other) {
    var result = false;
    if (other is JsonWidgetParams) {
      result = true;
      result = result && isDeferred == other.isDeferred;
      result = result && isFunction == other.isFunction;
      result = result && isStatic == other.isStatic;
      result = result && isVariable == other.isVariable;
      result = result && key == other.key;
    }

    return result;
  }

  @override
  int get hashCode =>
      '$key.$isDeferred.$isFunction.$isStatic.$isVariable'.hashCode;

  @override
  String toString() =>
      'JsonWidgetParams{isDeferred: $isDeferred, isFunction: $isFunction, isStatic: $isStatic, isVariable: $isVariable, key: "$key"}';
}

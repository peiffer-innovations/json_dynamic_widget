import 'package:meta/meta.dart';

@immutable
class JsonWidgetRegexHelper {
  JsonWidgetRegexHelper._();

  static final dynamicVarRegex = RegExp(r'^\{\{\s*\S*\s*\}\}$');
  static final functionRegex = RegExp(r'^##(\S*)\s*(\(.*\))##$');
  static final paramsRegex = RegExp(r'(\!?{{0,2}[^,\{\(\)\}]*\}{0,2})');
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

        var matches = paramsRegex.allMatches(data!);
        for (var match in matches) {
          var group = match.group(0);
          if (group?.trim().isNotEmpty == true) {
            if (group!.startsWith('!{{') && group.endsWith('}}')) {
              params.add(
                JsonWidgetParams(
                  isStatic: true,
                  isVariable: true,
                  key: group.substring(3, group.length - 2).trim(),
                ),
              );
            } else if (group.startsWith('{{') && group.endsWith('}}')) {
              params.add(
                JsonWidgetParams(
                  isVariable: true,
                  key: group.substring(2, group.length - 2).trim(),
                ),
              );
            } else {
              params.add(JsonWidgetParams(key: group.trim()));
            }
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
    required this.key,
  }) : assert(key?.isNotEmpty == true);

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

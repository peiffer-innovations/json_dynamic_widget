import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/src/components/processors/arg_processor.dart';

class LegacyVariableArgProcessor implements ArgProcessor {
  final _matchRegexp = RegExp(r'^\s*(!)?\{\{\s*(\S*)\s*\}\}\s*$');
  @override
  bool support(dynamic arg) {
    return arg != null && arg is String && _matchRegexp.hasMatch(arg);
  }

  @override
  ProcessedArg process(JsonWidgetRegistry registry, dynamic arg) {
    var regexpMatch = _matchRegexp.firstMatch(arg.toString())!;

    var isStatic = regexpMatch.group(1)! == '!';
    var varName = regexpMatch.group(2)!;

    var dynamicKeys = createDynamicKeys(isStatic, varName);
    var value = resolveValue(varName, registry);

    return ProcessedArg(dynamicKeys: dynamicKeys, value: value);
  }

  Set<String> createDynamicKeys(bool isStatic, String varName) {
    var dynamicKeys = <String>{};
    if (!isStatic && varName != '') {
      dynamicKeys.add(varName);
    }
    return dynamicKeys;
  }

  dynamic resolveValue(String varName, JsonWidgetRegistry registry) {
    dynamic value = '';
    if (varName != '') {
      value = registry.getValue(varName);
    }
    return value;
  }
}

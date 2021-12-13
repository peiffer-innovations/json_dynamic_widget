import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/src/components/processors/arg_processor.dart';
import 'package:json_dynamic_widget/src/components/processors/legacy_variable_arg_processor.dart';
import 'package:json_dynamic_widget/src/components/processors/raw_arg_processor.dart';

class LegacyFunctionArgProcessor implements ArgProcessor {
  final _matchRegexp = RegExp(r'^\s*##([^(]*)\s*\((.*)\)##\s*$');
  final _functionParamsSplitRegexp = RegExp(r'(?<!\\),');
  final List<ArgProcessor> _functionParamProcessors = [
    _namedFunctionArgProcessor(),
    LegacyVariableArgProcessor(),
    RawArgProcessor(),
  ];
  @override
  bool support(dynamic arg) {
    return arg != null && arg is String && _matchRegexp.hasMatch(arg);
  }

  @override
  ProcessedArg process(JsonWidgetRegistry registry, dynamic arg) {
    var regexpMatch = _matchRegexp.firstMatch(arg.toString())!;

    var functionName = regexpMatch.group(1)!;
    var functionParamsStr = regexpMatch.group(2)!.trim();
    var processedFunctionParams = splitFunctionParams(functionParamsStr).map(
      (functionParam) => processFunctionParam(registry, functionParam),
    );

    var dynamicKeys = extractDynamicKeys(processedFunctionParams);
    var functionParamValues =
        extractFunctionParamValues(processedFunctionParams);

    return ProcessedArg(
        dynamicKeys: dynamicKeys,
        value: registry.execute(functionName, functionParamValues));
  }

  Iterable<String> splitFunctionParams(String functionParamsStr) {
    return functionParamsStr
        .split(_functionParamsSplitRegexp)
        .map((functionParam) => functionParam.trim().replaceAll('\\,', ','));
  }

  ProcessedArg processFunctionParam(
    JsonWidgetRegistry registry,
    String functionParam,
  ) {
    var processor = _functionParamProcessors.firstWhere(
      (processor) => processor.support(functionParam),
    );
    return processor.process(registry, functionParam);
  }

  Set<String> extractDynamicKeys(
      Iterable<ProcessedArg> processedFunctionParams) {
    var dynamicKeys = <String>{};
    processedFunctionParams.forEach(
      (processedFunctionParam) {
        dynamicKeys.addAll(processedFunctionParam.dynamicKeys.toList());
      },
    );
    return dynamicKeys;
  }

  List<dynamic> extractFunctionParamValues(
      Iterable<ProcessedArg> processedFunctionParams) {
    return processedFunctionParams
        .map((processedFunctionParam) => processedFunctionParam.value)
        .toList();
  }

  dynamic resolveValue(String varName, JsonWidgetRegistry registry) {
    dynamic value = '';
    if (varName != '') {
      value = registry.getValue(varName);
    }
    return value;
  }
}

class _namedFunctionArgProcessor implements ArgProcessor {
  final _matchRegexp = RegExp(r'(:)(!?{{.*}})\s*$');
  final ArgProcessor variableProcessor = LegacyVariableArgProcessor();

  @override
  bool support(dynamic arg) {
    return arg != null && arg is String && _matchRegexp.hasMatch(arg);
  }

  @override
  ProcessedArg process(JsonWidgetRegistry registry, dynamic arg) {
    var functionParamStr = arg.toString();
    var separatorIndex = _matchRegexp.firstMatch(arg)!.start;
    var functionParamName = functionParamStr.substring(0, separatorIndex);
    var functionParamValueRaw = functionParamStr.substring(separatorIndex + 1);
    var functionParamValueProcessed =
        variableProcessor.process(registry, functionParamValueRaw);
    return ProcessedArg(
      dynamicKeys: functionParamValueProcessed.dynamicKeys,
      value: NamedFunctionArg(
          name: functionParamName,
          original: functionParamValueRaw,
          value: functionParamValueProcessed.value),
    );
  }
}

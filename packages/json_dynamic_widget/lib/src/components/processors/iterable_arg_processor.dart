import 'package:json_dynamic_widget/src/components/json_widget_registry.dart';
import 'package:json_dynamic_widget/src/components/processors/arg_processor.dart';
import 'package:json_dynamic_widget/src/models/processed_args.dart';

/// Processor for iterable [arg].  The processor is processing every value of
/// the [arg] using [JsonWidgetRegistry] processsors and it is aggregating all
/// listen variable names. In case of passing [jsonWidgetListenVariables] directly then
/// the aggregation step is skipped.
class IterableArgProcessor implements ArgProcessor {
  @override
  bool support(dynamic arg) => arg != null && arg is Iterable;

  @override
  ProcessedArg process(
    JsonWidgetRegistry registry,
    dynamic arg,
    Set<String>? jsonWidgetListenVariables,
  ) {
    final calculateListenVariables = jsonWidgetListenVariables == null;
    final resultListenVariables = jsonWidgetListenVariables ?? <String>{};

    final iterableArg = arg as Iterable;
    final processedArgs = [];
    for (var arg in iterableArg) {
      final processedArg = registry.processArgs(arg, jsonWidgetListenVariables);
      processedArgs.add(processedArg.value);

      if (calculateListenVariables) {
        resultListenVariables.addAll(
          processedArg.jsonWidgetListenVariables.toList(),
        );
      }
    }
    return ProcessedArg(
      value: processedArgs,
      jsonWidgetListenVariables: resultListenVariables,
    );
  }
}

import 'package:json_dynamic_widget/src/components/json_widget_registry.dart';
import 'package:json_dynamic_widget/src/components/processors/arg_processor.dart';
import 'package:json_dynamic_widget/src/models/processed_args.dart';

class IterableArgProcessor implements ArgProcessor {
  @override
  bool support(dynamic arg) {
    return arg != null && arg is Iterable;
  }

  @override
  ProcessedArg process(
      JsonWidgetRegistry registry, dynamic arg, Set<String>? listenVariables) {
    var calculateListenVariables = listenVariables == null;
    var resultListenVariables = listenVariables ?? <String>{};

    var iterableArg = arg as Iterable;
    var processedArgs = [];
    iterableArg.forEach((arg) {
      var processedArg = registry.processArgs(arg, listenVariables);
      processedArgs.add(processedArg.value);
      if (calculateListenVariables) {
        resultListenVariables.addAll(processedArg.listenVariables.toList());
      }
    });
    return ProcessedArg(
        value: processedArgs, listenVariables: resultListenVariables);
  }
}

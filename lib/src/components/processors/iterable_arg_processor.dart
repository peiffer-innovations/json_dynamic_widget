import 'package:json_dynamic_widget/src/components/json_widget_registry.dart';
import 'package:json_dynamic_widget/src/components/processors/arg_processor.dart';
import 'package:json_dynamic_widget/src/models/processed_args.dart';

class IterableArgProcessor implements ArgProcessor {
  @override
  bool support(dynamic arg) {
    return arg != null && arg is Iterable;
  }

  @override
  ProcessedArg process(JsonWidgetRegistry registry, dynamic arg) {
    var iterableArg = arg as Iterable;
    var dynamicKeys = <String>{};
    var processedArgs = [];
    iterableArg.forEach((arg) {
      var processedArg = registry.processArgs(arg);
      processedArgs.add(processedArg.value);
      dynamicKeys.addAll(processedArg.dynamicKeys.toList());
    });
    return ProcessedArg(value: processedArgs, dynamicKeys: dynamicKeys);
  }
}

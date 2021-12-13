import 'package:json_dynamic_widget/src/components/json_widget_registry.dart';
import 'package:json_dynamic_widget/src/components/processors/arg_processor.dart';
import 'package:json_dynamic_widget/src/models/processed_args.dart';

class MapArgProcessor implements ArgProcessor {
  @override
  bool support(dynamic arg) {
    return arg != null && arg is Map;
  }

  @override
  ProcessedArg process(JsonWidgetRegistry registry, dynamic arg) {
    var mapArg = arg as Map;
    var dynamicKeys = <String>{};
    mapArg.keys.forEach((key) {
      var processedArg = registry.processArgs(mapArg[key]);
      mapArg[key] = processedArg.value;
      dynamicKeys.addAll(processedArg.dynamicKeys.toList());
    });
    return ProcessedArg(value: mapArg, dynamicKeys: dynamicKeys);
  }
}

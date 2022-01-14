import 'dart:core';

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
    var processedMapArg = {};

    if (_isJsonWidgetData(mapArg)) {
      // The entry has a "type" and one of: "child", "children", "args".  This
      // means the item is most likely a JsonWidgetData class, so we should
      // not process the args yet.  We should wait until the actual
      // JsonWidgetData gets built.
      return ProcessedArg(value: arg, dynamicKeys: dynamicKeys);
    }

    mapArg.keys.forEach((key) {
      var processedArg = registry.processArgs(mapArg[key]);
      processedMapArg[key] = processedArg.value;
      dynamicKeys.addAll(processedArg.dynamicKeys.toList());
    });
    return ProcessedArg(value: processedMapArg, dynamicKeys: dynamicKeys);
  }

  bool _isJsonWidgetData(Map mapArg) {
    return mapArg['type'] != null &&
        (mapArg['child'] != null ||
            mapArg['children'] != null ||
            mapArg['args'] != null);
  }
}

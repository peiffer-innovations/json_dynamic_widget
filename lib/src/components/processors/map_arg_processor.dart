import 'dart:core';

import 'package:json_dynamic_widget/src/components/json_widget_registry.dart';
import 'package:json_dynamic_widget/src/components/processors/arg_processor.dart';
import 'package:json_dynamic_widget/src/components/processors/expression_arg_processor.dart';
import 'package:json_dynamic_widget/src/components/processors/raw_arg_processor.dart';
import 'package:json_dynamic_widget/src/models/json_widget_data.dart';
import 'package:json_dynamic_widget/src/models/processed_args.dart';

/// Processor for map [arg]. It is entry point for [JsonWidgetData] args.
/// If the [arg] is detected to be [JsonWidgetData] then processing of such
/// an [arg] is skipped.
///
/// The processor is processing every key/value of the [arg] using
/// [JsonWidgetRegistry] processsors and it is aggregating all
/// listen variable names. In case of passing [listenVariables] directly
/// then the aggregation step is skipped.
class MapArgProcessor implements ArgProcessor {
  /// Processors used to resolve map key. For map value the [JsonWidgetRegistry]
  /// one are used.
  final List<ArgProcessor> _keyProcessors = [
    ExpressionArgProcessor(),
    RawArgProcessor()
  ];

  @override
  bool support(dynamic arg) => arg != null && arg is Map;

  @override
  ProcessedArg process(
    JsonWidgetRegistry registry,
    dynamic arg,
    Set<String>? listenVariables,
  ) {
    var mapArg = arg as Map;
    var calculateListenVariables = listenVariables == null;
    var resultListenVariables = listenVariables ?? <String>{};
    var processedMapArg = {};

    if (_isJsonWidgetData(mapArg)) {
      // The entry has a "type" and one of: "child", "children", "args".  This
      // means the item is most likely a JsonWidgetData class, so we should
      // not process the args yet.  We should wait until the actual
      // JsonWidgetData gets built.
      return ProcessedArg(value: arg, listenVariables: resultListenVariables);
    }

    mapArg.keys.forEach((key) {
      var processedKeyArg = _processKey(registry, key, listenVariables);
      var processedValueArg =
          registry.processArgs(mapArg[key], listenVariables);
      processedMapArg[processedKeyArg.value] = processedValueArg.value;
      if (calculateListenVariables) {
        resultListenVariables.addAll(processedKeyArg.listenVariables.toList());
        resultListenVariables.addAll(
          processedValueArg.listenVariables.toList(),
        );
      }
    });
    return ProcessedArg(
      value: processedMapArg,
      listenVariables: resultListenVariables,
    );
  }

  ProcessedArg _processKey(
    JsonWidgetRegistry registry,
    String key,
    Set<String>? listenVariables,
  ) {
    return _keyProcessors
        .firstWhere(
          (parser) => parser.support(key),
          orElse: () => RawArgProcessor(),
        )
        .process(registry, key, listenVariables);
  }

  bool _isJsonWidgetData(Map mapArg) {
    return mapArg['type'] != null &&
        (mapArg['child'] != null ||
            mapArg['children'] != null ||
            mapArg['args'] != null);
  }
}

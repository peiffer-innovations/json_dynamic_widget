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
/// listen variable names. In case of passing [jsonWidgetListenVariables] directly
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
    Set<String>? jsonWidgetListenVariables,
  ) {
    final mapArg = arg as Map;
    final calculateListenVariables = jsonWidgetListenVariables == null;
    final resultListenVariables = jsonWidgetListenVariables ?? <String>{};
    final processedMapArg = {};

    if (_isJsonWidgetData(mapArg)) {
      // The entry has a "type" and one of: "child", "children", "args".  This
      // means the item is most likely a JsonWidgetData class, so we should
      // not process the args yet.  We should wait until the actual
      // JsonWidgetData gets built.
      return ProcessedArg(
          value: arg, jsonWidgetListenVariables: resultListenVariables);
    }

    for (var key in mapArg.keys) {
      final processedKeyArg =
          _processKey(registry, key, jsonWidgetListenVariables);
      final processedValueArg =
          registry.processArgs(mapArg[key], jsonWidgetListenVariables);
      processedMapArg[processedKeyArg.value] = processedValueArg.value;
      if (calculateListenVariables) {
        resultListenVariables
            .addAll(processedKeyArg.jsonWidgetListenVariables.toList());
        resultListenVariables.addAll(
          processedValueArg.jsonWidgetListenVariables.toList(),
        );
      }
    }
    return ProcessedArg(
      value: processedMapArg,
      jsonWidgetListenVariables: resultListenVariables,
    );
  }

  ProcessedArg _processKey(
    JsonWidgetRegistry registry,
    String key,
    Set<String>? jsonWidgetListenVariables,
  ) {
    return _keyProcessors
        .firstWhere(
          (parser) => parser.support(key),
          orElse: () => RawArgProcessor(),
        )
        .process(registry, key, jsonWidgetListenVariables);
  }

  bool _isJsonWidgetData(Map mapArg) {
    return mapArg['type'] != null && mapArg['args'] != null;
  }
}

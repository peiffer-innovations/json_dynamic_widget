import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:logging/logging.dart';

/// The `for_each` function takes 2 to 4 arguments.
///
/// 1. The items to iterate over.
/// 2. The template to use when building the widget for each entry.
/// 3. Optional name to place the value in.  If not set, the variable will be placed in the name "value".
/// 4. Optional name to place the key (if the iterable is a [Map]) or index (if the iterable is a [List]).
class ForEachFunction {
  static const key = 'for_each';
  static final _logger = Logger('for_each');
  static final JsonWidgetFunction body = ({
    required List<dynamic>? args,
    required JsonWidgetRegistry registry,
  }) {
    var iterable = args![0];
    var template = '\${${args[1]}}';

    var varName = 'value';
    var keyName = 'key';
    if (args.length >= 3) {
      varName = args[2];
    }
    if (args.length >= 4) {
      keyName = args[3];
    }

    var results = <JsonWidgetData>[];
    if (iterable is Iterable) {
      var index = 0;
      for (var value in iterable) {
        var reg = JsonWidgetRegistry(
          debugLabel: 'for_each_$index',
          parent: registry,
        );
        _logger.finest('[$index] [$value]');
        reg.setValue(
          varName,
          value,
          originator: null,
        );
        reg.setValue(
          keyName,
          index++,
          originator: null,
        );

        results.add(
          DeferredJsonWidgetData(
            key: template,
            registry: reg,
          ),
        );
      }
    } else if (iterable is Map) {
      for (var entry in iterable.entries) {
        var reg = JsonWidgetRegistry(parent: registry);
        _logger.finest('[${entry.key}] [${entry.value}]');
        reg.setValue(
          varName,
          entry.value,
          originator: null,
        );
        reg.setValue(
          keyName,
          entry.key,
          originator: null,
        );

        results.add(
          DeferredJsonWidgetData(
            key: template,
            registry: reg,
          ),
        );
      }
    }

    return results;
  };
}

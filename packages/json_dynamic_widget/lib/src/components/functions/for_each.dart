import 'dart:convert';
import 'dart:math';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:logging/logging.dart';

final _random = Random();

/// The `for_each` function takes 2 to 4 arguments.
///
/// 1. The items to iterate over.
/// 2. The template to use when building the widget for each entry.
/// 3. Optional name to place the value in.  If not set, the variable will be placed in the name "value".
/// 4. Optional name to place the key (if the iterable is a [Map]) or index (if the iterable is a [List]).
class ForEachFunction {
  static const JsonWidgetFunction body = _body;
  static const key = 'for_each';

  static final _logger = Logger('for_each');
  static String _random10Digits() {
    final buffer = StringBuffer();
    for (var i = 0; i < 10; i++) {
      buffer.write(_random.nextInt(10)); // 0–9
    }
    return buffer.toString();
  }

  static dynamic _body({
    required List<dynamic>? args,
    required JsonWidgetRegistry registry,
  }) {
    final uniqueKey = _random10Digits();

    final iterable = args![0];
    final template = '\${${args[1]}}';
    final templateObjectString = json.encode(registry.getValue(args[1]));
    var varName = 'value';
    var keyName = 'key';
    if (args.length >= 3) {
      varName = args[2];
    }
    if (args.length >= 4) {
      keyName = args[3];
    }

    final results = <JsonWidgetData>[];
    if (iterable is Iterable) {
      var index = 0;
      for (var value in iterable) {
        _logger.finest('[$index] [$value]');
        final indexStr = index.toString();

        registry.setValue(
          '${varName}_${uniqueKey}_$indexStr',
          value,
          originator: null,
        );
        registry.setValue(
          '${keyName}_${uniqueKey}_$indexStr',
          index,
          originator: null,
        );

        final varPattern = RegExp(
          r'(?<!\w)' + RegExp.escape(varName) + r'(?!\w)',
        );
        final keyPattern = RegExp(
          r'(?<!\w)' + RegExp.escape(keyName) + r'(?!\w)',
        );

        final replacedTemplate = templateObjectString
            .replaceAllMapped(
              varPattern,
              (match) => '${varName}_${uniqueKey}_$indexStr',
            )
            .replaceAllMapped(
              keyPattern,
              (match) => '${keyName}_${uniqueKey}_$indexStr',
            );
        results.add(
          DeferredJsonWidgetData(
            key: json.decode(replacedTemplate),
            registry: registry,
          ),
        );
        ++index;
      }
    } else if (iterable is Map) {
      for (var entry in iterable.entries) {
        _logger.finest('[${entry.key}] [${entry.value}]');
        registry.setValue(
          '${varName}_${uniqueKey}_${entry.key}',
          entry.value,
          originator: null,
        );
        registry.setValue(
          '${keyName}_${uniqueKey}_${entry.key}',
          entry.key,
          originator: null,
        );

        final varPattern = RegExp(
          r'(?<!\w)' + RegExp.escape(varName) + r'(?!\w)',
        );
        final keyPattern = RegExp(
          r'(?<!\w)' + RegExp.escape(keyName) + r'(?!\w)',
        );

        final replacedTemplate = templateObjectString
            .replaceAllMapped(
              varPattern,
              (match) => '${varName}_${uniqueKey}_${entry.key}',
            )
            .replaceAllMapped(
              keyPattern,
              (match) => '${keyName}_${uniqueKey}_${entry.key}',
            );
        results.add(
          DeferredJsonWidgetData(
            key: json.decode(replacedTemplate),
            registry: registry,
          ),
        );
      }
    }

    return results;
  }
}

import 'dart:convert';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:logging/logging.dart';

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
  static int _uniqueKeyCounter = 0;
  static final _wordChar = RegExp(r'\w');

  static String _nextUniqueKey() {
    final timestamp = DateTime.now().microsecondsSinceEpoch.toRadixString(36);
    final counter = (_uniqueKeyCounter++).toRadixString(36);
    return '${timestamp}_$counter';
  }

  static void _cleanupRegistryValues(
    JsonWidgetRegistry registry,
    Iterable<String> keys,
  ) {
    for (final key in keys) {
      registry.removeValue(key, originator: null);
    }
  }

  static dynamic _body({
    required List<dynamic>? args,
    required JsonWidgetRegistry registry,
  }) {
    final uniqueKey = _nextUniqueKey();

    final iterable = args![0];
    final templateObjectString = json.encode(registry.getValue(args[1]));
    var varName = 'value';
    var keyName = 'key';
    if (args.length >= 3) {
      varName = args[2];
    }
    if (args.length >= 4) {
      keyName = args[3];
    }
    final placeholderPattern = RegExp(r'\$\{([^}]*)\}');
    final results = <JsonWidgetData>[];
    if (iterable is Iterable) {
      var index = 0;
      for (var value in iterable) {
        _logger.finest('[$index] [$value]');
        final indexStr = index.toString();
        final valueKey = '${varName}_${uniqueKey}_$indexStr';
        final keyKey = '${keyName}_${uniqueKey}_$indexStr';

        registry.setValue(
          valueKey,
          value,
          originator: null,
        );
        registry.setValue(
          keyKey,
          index,
          originator: null,
        );

        final replacedTemplate = templateObjectString.replaceAllMapped(
          placeholderPattern,
          (match) {
            var inside = match.group(1)!;
            inside = _replaceIdentifiersOutsideStringLiterals(
              inside,
              {
                varName: valueKey,
                keyName: keyKey,
              },
            );

            return '\${$inside}';
          },
        );

        results.add(
          DeferredJsonWidgetData(
            key: json.decode(replacedTemplate),
            registry: registry,
            onResolved: () => _cleanupRegistryValues(
              registry,
              [valueKey, keyKey],
            ),
          ),
        );
        ++index;
      }
    } else if (iterable is Map) {
      for (var entry in iterable.entries) {
        _logger.finest('[${entry.key}] [${entry.value}]');
        final valueKey = '${varName}_${uniqueKey}_${entry.key}';
        final keyKey = '${keyName}_${uniqueKey}_${entry.key}';

        registry.setValue(
          valueKey,
          entry.value,
          originator: null,
        );
        registry.setValue(
          keyKey,
          entry.key,
          originator: null,
        );

        final replacedTemplate = templateObjectString.replaceAllMapped(
          placeholderPattern,
          (match) {
            var inside = match.group(1)!;
            inside = _replaceIdentifiersOutsideStringLiterals(
              inside,
              {
                varName: valueKey,
                keyName: keyKey,
              },
            );

            return '\${$inside}';
          },
        );

        results.add(
          DeferredJsonWidgetData(
            key: json.decode(replacedTemplate),
            registry: registry,
            onResolved: () => _cleanupRegistryValues(
              registry,
              [valueKey, keyKey],
            ),
          ),
        );
      }
    }

    return results;
  }

  static String _replaceIdentifiersOutsideStringLiterals(
    String input,
    Map<String, String> replacements,
  ) {
    final buffer = StringBuffer();
    String? quote;
    var index = 0;

    while (index < input.length) {
      final char = input[index];

      if (quote != null) {
        buffer.write(char);
        if (char == quote) {
          var backslashCount = 0;
          var backIndex = index - 1;
          while (backIndex >= 0 && input[backIndex] == '\\') {
            backslashCount++;
            backIndex--;
          }
          if (backslashCount.isEven) {
            quote = null;
          }
        }
        index++;
        continue;
      }

      if (char == '\'' || char == '"') {
        quote = char;
        buffer.write(char);
        index++;
        continue;
      }

      String? replacementValue;
      int? replacementLength;
      for (final entry in replacements.entries) {
        final name = entry.key;
        final length = name.length;
        if (index + length > input.length) {
          continue;
        }
        if (!input.startsWith(name, index)) {
          continue;
        }
        final beforeOk =
            index == 0 || !_wordChar.hasMatch(input[index - 1]);
        final afterOk = index + length == input.length ||
            !_wordChar.hasMatch(input[index + length]);
        if (beforeOk && afterOk) {
          replacementValue = entry.value;
          replacementLength = length;
          break;
        }
      }

      if (replacementValue != null) {
        buffer.write(replacementValue);
        index += replacementLength!;
        continue;
      }

      buffer.write(char);
      index++;
    }

    return buffer.toString();
  }
}

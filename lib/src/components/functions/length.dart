import 'dart:convert';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// The `length` function
/// takes 1 argument.  The return value depend on the type of the arg.
///
/// * [String]: the length of the string will be returned
/// * [List]: The length of the list will be returned
/// * [Map]: The number of elements in the map will be returned
/// * [Set]: The number of elements in the set will be returned
/// * [Iterable]: The number of elements in the iterable will be returned
/// * [int]: The arg itself will be returned
/// * [double]: The [int] value of the arg will be returned
class LengthFunction {
  static const key = 'length';
  static final JsonWidgetFunction body = ({
    required List<dynamic>? args,
    required JsonWidgetRegistry registry,
  }) {
    if (args == null || args.isEmpty) {
      throw Exception('[length]: Missing required first arg');
    }

    var entry = args[0];
    if (entry is String &&
        (entry.startsWith('[') && entry.endsWith(']') ||
            (entry.startsWith('{') && entry.endsWith('}')))) {
      entry = json.decode(entry);
    }

    int result;

    if (entry is String ||
        entry is Map ||
        entry is List ||
        entry is Set ||
        entry is Iterable) {
      result = entry.length;
    } else if (entry is num) {
      result = entry.toInt();
    } else {
      throw Exception(
        '[length]: Unknown type: ${entry.runtimeType.toString()}',
      );
    }
    return result;
  };
}

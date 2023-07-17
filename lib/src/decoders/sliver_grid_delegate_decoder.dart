import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';

class SliverGridDelegateDecoder {
  static SliverGridDelegate decodeGridDelegate({
    required dynamic gridDelegate,
  }) {
    SliverGridDelegate? result;

    Exception createException(message) => Exception('''
$message

1. "delegate": {
  "type": "max_cross_axis_extent",
  "childAspectRatio": "<double?>",
  "crossAxisSpacing": "<double?>",
  "mainAxisExtent": "<double?>",
  "mainAxisSpacing": "<double?>",
  "maxCrossAxisExtent": "<double>"
}

2. "delegate": {
  "type": "fixed_cross_axis_count",
  "crossAxisCount": "<int>",
  "childAspectRatio": "<double?>",
  "crossAxisSpacing": "<double?>",
  "mainAxisExtent": "<double?>",
  "mainAxisSpacing": "<double?>"
}''');

    if (gridDelegate is SliverGridDelegate) {
      result = gridDelegate;
    } else if (gridDelegate != null) {
      var delegate = gridDelegate;
      if (delegate is String &&
          (delegate.startsWith('{') && delegate.endsWith('}'))) {
        try {
          delegate = json.decode(delegate);
        } catch (e) {
          // no-op; it isn't JSON
        }
      }

      final type = delegate['type'] ?? 'maxCrossAxisExtent';
      switch (type) {
        case 'max_cross_axis_extent':
          result = SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio:
                JsonClass.maybeParseDouble(delegate['childAspectRatio']) ?? 1.0,
            crossAxisSpacing:
                JsonClass.maybeParseDouble(delegate['crossAxisSpacing']) ?? 0.0,
            mainAxisExtent: JsonClass.maybeParseDouble(delegate['mainAxisExtent']),
            mainAxisSpacing:
                JsonClass.maybeParseDouble(delegate['mainAxisSpacing']) ?? 0.0,
            maxCrossAxisExtent:
                JsonClass.maybeParseDouble(delegate['maxCrossAxisExtent'])!,
          );
          break;

        case 'fixed_cross_axis_count':
          result = SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: JsonClass.maybeParseInt(delegate['crossAxisCount'])!,
            childAspectRatio:
                JsonClass.maybeParseDouble(delegate['childAspectRatio']) ?? 1.0,
            crossAxisSpacing:
                JsonClass.maybeParseDouble(delegate['crossAxisSpacing']) ?? 0.0,
            mainAxisExtent: JsonClass.maybeParseDouble(delegate['mainAxisExtent']),
            mainAxisSpacing:
                JsonClass.maybeParseDouble(delegate['mainAxisSpacing']) ?? 0.0,
          );
          break;

        default:
          throw createException('''
[grid_builder]: Unknown delegate type encountered: [$type].  To resolve this add
a delegate arg that follows one of the two structures:''');
      }
    } else {
      throw Exception('''
[grid_builder]: A null value was passed in as the grid delegate despite the 
delegate infor being required.
''');
    }

    return result;
  }
}

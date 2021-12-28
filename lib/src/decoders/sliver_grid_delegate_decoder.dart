import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';

class SliverGridDelegateDecoder {
  static SliverGridDelegate decodeGridDelegate({
    required dynamic gridDelegate,
  }) {
    SliverGridDelegate? result;

    var createException = (message) => Exception('''
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

      var type = delegate['type'] ?? 'maxCrossAxisExtent';
      switch (type) {
        case 'max_cross_axis_extent':
          result = SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio:
                JsonClass.parseDouble(delegate['childAspectRatio']) ?? 1.0,
            crossAxisSpacing:
                JsonClass.parseDouble(delegate['crossAxisSpacing']) ?? 0.0,
            mainAxisExtent: JsonClass.parseDouble(delegate['mainAxisExtent']),
            mainAxisSpacing:
                JsonClass.parseDouble(delegate['mainAxisSpacing']) ?? 0.0,
            maxCrossAxisExtent:
                JsonClass.parseDouble(delegate['maxCrossAxisExtent'])!,
          );
          break;

        case 'fixed_cross_axis_count':
          result = SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: JsonClass.parseInt(delegate['crossAxisCount'])!,
            childAspectRatio:
                JsonClass.parseDouble(delegate['childAspectRatio']) ?? 1.0,
            crossAxisSpacing:
                JsonClass.parseDouble(delegate['crossAxisSpacing']) ?? 0.0,
            mainAxisExtent: JsonClass.parseDouble(delegate['mainAxisExtent']),
            mainAxisSpacing:
                JsonClass.parseDouble(delegate['mainAxisSpacing']) ?? 0.0,
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

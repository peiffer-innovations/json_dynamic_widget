import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';

void main() {
  test('output', () async {
    var output = Directory('output');
    if (output.existsSync()) {
      output.deleteSync(recursive: true);
    }

    output.createSync(recursive: true);

    var encoder = JsonEncoder.withIndent('  ');
    for (var schema in JsonDynamicWidgetSchemas.all.values) {
      for (var i = 0; i < 3; i++) {
        try {
          var id = schema['\$id'];
          var fileName = id.split('/').last;

          var file = File('${output.path}/$fileName');
          file.createSync(recursive: true);

          file.writeAsStringSync(encoder.convert(schema));

          // ignore: avoid_print
          print('Wrote: $fileName');
          break;
        } catch (e) {
          if (i == 2) {
            rethrow;
          }

          await Future.delayed(Duration(milliseconds: 100));
        }
      }
    }
  });
}

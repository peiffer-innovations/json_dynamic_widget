import 'dart:convert';
import 'dart:io';

import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
import 'package:json_theme/json_theme_schemas.dart';

void main() {
  var dir = Directory('./schemas');
  // ignore: avoid_print
  print(dir.absolute.path);

  try {
    dir.deleteSync(recursive: true);
  } catch (e) {
    //no-op
  }

  try {
    var jdw = Directory('./schemas/json_dynamic_widget');
    var theme = Directory('./schemas/json_theme');

    jdw.createSync(recursive: true);
    theme.createSync(recursive: true);

    for (var schema in Schemas.all.values) {
      try {
        var file = File('${theme.path}/${schema[r'$id'].split('/').last}');

        file.createSync(recursive: true);

        file.writeAsStringSync(JsonEncoder.withIndent('  ').convert(schema));
        // ignore: avoid_print
        print('Wrote: ${file.path}');
      } catch (e) {
        // ignore: avoid_print
        print('$e');
        // ignore: avoid_print
        print(schema);
      }
    }
    for (var schema in JsonDynamicWidgetSchemas.all.values) {
      try {
        var file = File('${jdw.path}/${schema[r'$id'].split('/').last}');
        file.createSync(recursive: true);

        file.writeAsStringSync(JsonEncoder.withIndent('  ').convert(schema));
        // ignore: avoid_print
        print('Wrote: ${file.path}');
      } catch (e) {
        // ignore: avoid_print
        print('$e');
        // ignore: avoid_print
        print(schema);
      }
    }
  } finally {
    exit(0);
  }
}

// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:yaml_writer/yaml_writer.dart';
import 'package:yaon/yaon.dart';

void main(List<String> args) {
  final path = args.isEmpty ? 'assets' : args[0];

  final dir = Directory(path);
  print('''
Attempting to migrate the files found in:
  - ${dir.absolute.path}
''');

  final files = dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((e) => e.path.endsWith('.json') || e.path.endsWith('.yaml'));

  var error = false;
  for (var file in files) {
    try {
      final isYaml = file.path.endsWith('.yaml');
      final content = file.readAsStringSync();

      final data = yaon.parse(
        content,
        normalize: true,
      );

      final migrated = _migrate(data);
      if (migrated) {
        final output = File('${file.path}.bak');
        if (!output.existsSync()) {
          output.createSync(recursive: true);
        }
        output.writeAsStringSync(content);
        if (isYaml) {
          file.writeAsStringSync(
            YAMLWriter(
              allowUnquotedStrings: true,
              indentSize: 2,
            ).convert(data),
          );
        } else {
          file.writeAsStringSync(
            const JsonEncoder.withIndent('  ').convert(data),
          );
        }
        print('[migrated]: ${file.path}');
      }
    } catch (e, stack) {
      error = true;
      print('''
Error migrating JSON file.
$e
$stack
''');
    }
  }

  if (error) {
    exit(1);
  }

  exit(0);
}

bool _migrate(dynamic input) {
  var result = false;
  const functions = {
    'set_value': _migrateSetValue,
    'set_widget': _migrateSetWidget,
  };

  if (input is Map) {
    final migration = functions[input['type']];
    if (migration != null) {
      result = migration(input);
    } else {
      result = _migrateMap(input);
    }
  } else if (input is Iterable) {
    result = _migrateList(input);
  }

  return result;
}

bool _migrateMap(Map map) {
  var result = false;

  for (var entry in map.entries) {
    result = _migrate(entry.value) || result;
  }

  return result;
}

bool _migrateList(Iterable list) {
  var result = false;

  for (var input in list) {
    result = _migrate(input) || result;
  }

  return result;
}

bool _migrateSetValue(Map input) {
  var result = false;
  final args = input['args'];

  if (args is Map) {
    if (!args.containsKey('values')) {
      final updated = {
        'values': Map<String, dynamic>.from(args),
      };

      input['args'] = updated;
      result = true;
    }
  }

  return result;
}

bool _migrateSetWidget(Map input) {
  var result = false;
  final args = input['args'];

  if (args is Map) {
    if (!args.containsKey('widgets')) {
      final updated = {
        'widgets': Map<String, dynamic>.from(args),
      };

      input['args'] = updated;
      result = true;
    }
  }

  return result;
}

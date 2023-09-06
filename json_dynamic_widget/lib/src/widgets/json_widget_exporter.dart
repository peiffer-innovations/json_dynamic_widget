import 'dart:convert';
import 'dart:math';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/src/builders/json_exportable_builder.dart';
import 'package:logging/logging.dart';
import 'package:yaml_writer/yaml_writer.dart';

/// A function capable of encoding an object of a given type.  If the function
/// cannot decode the particular object, it should return `null`.
typedef JsonTypeEncoder = dynamic Function(Object);

enum ReverseEncodingMode {
  json,
  yaml,
}

class JsonWidgetExporter extends StatefulWidget {
  const JsonWidgetExporter({
    required this.child,
    super.key,
  });

  final JsonExportable child;

  static JsonWidgetExporterData? of(BuildContext context) {
    final result = maybeOf(context);
    if (result == null) {
      throw FlutterError(
        '''
JsonWidgetExporter operation requested with a context that does not include a
JsonWidgetExporter.  The context used to process JSON widget data must be a
widget that is a descendant of a JsonWidgetExporter widget.''',
      );
    }

    return result;
  }

  static JsonWidgetExporterData? maybeOf(BuildContext context) {
    JsonWidgetExporterData? data;
    if (context is StatefulElement && context.state is JsonWidgetExporterData) {
      data = context.state as JsonWidgetExporterData;
    }
    data = data ?? context.findAncestorStateOfType<JsonWidgetExporterData>();

    return data;
  }

  @override
  State createState() => JsonWidgetExporterData();
}

class JsonWidgetExporterData extends State<JsonWidgetExporter> {
  static final Logger _logger = Logger('JsonWidgetExporterData');

  JsonWidgetData? _data;

  void apply(JsonExportable exportable) {
    _data = exportable.child;
  }

  String export({
    List<JsonTypeEncoder> encoders = const <JsonTypeEncoder>[],
    String indent = '',
    ReverseEncodingMode mode = ReverseEncodingMode.json,
  }) {
    String? result;

    String encode(dynamic data) {
      String encoded;

      final jsonEncoder = JsonEncoder.withIndent(
        indent,
        (object) {
          dynamic output;

          for (var e in encoders) {
            output = e(object);

            if (output != null) {
              _logger.info('Found given encoder for object: [$object].');
              break;
            }
          }

          if (output == null) {
            _logger.warning('Unable to encode object: [$object]');
            output = r'${null}';
          }
          return output;
        },
      );
      switch (mode) {
        case ReverseEncodingMode.json:
          encoded = jsonEncoder.convert(data);
          break;

        case ReverseEncodingMode.yaml:
          final lines = YAMLWriter(
            allowUnquotedStrings: true,
            indentSize: max(indent.length, 2),
          )
              .convert(
                // This is a bit of a hack.  The YAML writer doesn't support passing
                // in custom object encoders.  So to prevent this from failing, use
                // the JSON encoder / decoder and then write the YAML.
                json.decode(jsonEncoder.convert(data)),
              )
              .split('\n');

          final buf = StringBuffer();
          for (var i = 0; i < lines.length; i++) {
            final line = lines[i];
            if (line.trim() == '-') {
              ++i;
              buf.writeln('${line.trimRight()} ${lines[i].trim()}');
            } else {
              buf.writeln(line);
            }
          }

          encoded = buf.toString();
          break;

        default:
          throw Exception('Unknown encoding mode [$mode] requested.');
      }

      return encoded;
    }

    try {
      result = encode(
        _data?.toJson() ??
            const {
              'type': 'error',
              'args': {
                'exception':
                    'Widget encoding was requested but no encodable widget registered with the exporter',
              },
            },
      );
    } catch (e, stack) {
      result = encode(
        {
          'type': 'error',
          'args': {
            'exception': '''
An error occurred when trying to encode the widgets into JSON.
$e
$stack
'''
          }
        },
      );
    }

    return result;
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

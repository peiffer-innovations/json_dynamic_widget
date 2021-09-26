import 'package:json_theme/json_theme_schemas.dart';

class OffstageSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/offstage.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Offstage-class.html',
    'type': 'object',
    'title': 'Offstage',
    'additionalProperties': false,
    'properties': {
      'offstage': SchemaHelper.boolSchema,
    }
  };
}

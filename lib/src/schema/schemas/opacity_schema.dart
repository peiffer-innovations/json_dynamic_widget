import 'package:json_theme/json_theme_schemas.dart';

class OpacitySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/opacity.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Opacity-class.html',
    'type': 'object',
    'title': 'Opacity',
    'additionalProperties': false,
    'required': [
      'opacity',
    ],
    'properties': {
      'alwaysIncludeSemantics': SchemaHelper.boolSchema,
      'opacity': SchemaHelper.numberSchema,
    },
  };
}

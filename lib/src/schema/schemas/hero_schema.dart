import 'package:json_theme/json_theme_schemas.dart';

class HeroSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/hero.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Hero-class.html',
    'type': 'object',
    'title': 'Hero',
    'additionalProperties': false,
    'required': [
      'tag',
    ],
    'properties': {
      'createRectTween': SchemaHelper.stringSchema,
      'flightShuttleBuilder': SchemaHelper.stringSchema,
      'placeholderBuilder': SchemaHelper.stringSchema,
      'tag': SchemaHelper.anySchema,
      'transitionOnUserGestures': SchemaHelper.boolSchema,
    },
  };
}

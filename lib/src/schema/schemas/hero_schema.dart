import 'package:json_theme/json_theme_schemas.dart';

class HeroSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/hero';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'HeroBuilder',
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

import 'package:json_theme/json_theme_schemas.dart';

class AnimatedThemeSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/animated_theme';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AnimatedThemeBuilder',
    'additionalProperties': false,
    'required': [
      'data',
    ],
    'properties': {
      'curve': SchemaHelper.stringSchema,
      'data': SchemaHelper.objectSchema(ThemeDataSchema.id),
      'duration': SchemaHelper.numberSchema,
      'isMaterialAppTheme': SchemaHelper.boolSchema,
      'onEnd': SchemaHelper.stringSchema,
    },
  };
}

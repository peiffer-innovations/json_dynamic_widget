import 'package:json_theme/json_theme_schemas.dart';

class AnimatedOpacitySchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/animated_opacity_schema';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AnimatedOpacityBuilder',
    'additionalProperties': false,
    'required': [
      'duration',
      'opacity',
    ],
    'properties': {
      'alwaysIncludeSemantics': SchemaHelper.boolSchema,
      'curve': SchemaHelper.stringSchema,
      'duration': SchemaHelper.numberSchema,
      'onEnd': SchemaHelper.stringSchema,
      'opacity': SchemaHelper.stringSchema,
    },
  };
}

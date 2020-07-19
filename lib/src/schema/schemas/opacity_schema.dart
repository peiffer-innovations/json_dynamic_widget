import 'package:json_theme/json_theme_schemas.dart';

class OpacitySchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/opacity';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'OpacityBuilder',
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

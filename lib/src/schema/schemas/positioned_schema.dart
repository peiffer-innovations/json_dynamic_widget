import 'package:json_theme/json_theme_schemas.dart';

class PositionedSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/positioned';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'PositionedBuilder',
    'additionalProperties': false,
    'properties': {
      'bottom': SchemaHelper.numberSchema,
      'height': SchemaHelper.numberSchema,
      'left': SchemaHelper.numberSchema,
      'right': SchemaHelper.numberSchema,
      'top': SchemaHelper.numberSchema,
      'width': SchemaHelper.numberSchema,
    },
  };
}

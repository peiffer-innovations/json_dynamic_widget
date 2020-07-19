import 'package:json_theme/json_theme_schemas.dart';

class CircularProgressIndicatorSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/circular_progress_indicator';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'CircularProgressIndicatorBuilder',
    'additionalProperties': false,
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'semanticsLabel': SchemaHelper.stringSchema,
      'semanticsValue': SchemaHelper.stringSchema,
      'strokeWidth': SchemaHelper.numberSchema,
      'value': SchemaHelper.numberSchema,
      'valueColor': SchemaHelper.anySchema
    },
  };
}

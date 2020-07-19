import 'package:json_theme/json_theme_schemas.dart';

class LinearProgressIndicatorSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/linear_progress_indicator';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'LinearProgressIndicatorBuilder',
    'additionalProperties': false,
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'semanticsLabel': SchemaHelper.stringSchema,
      'semanticsValue': SchemaHelper.stringSchema,
      'value': SchemaHelper.numberSchema,
      'valueColor': SchemaHelper.anySchema
    },
  };
}

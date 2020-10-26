import 'package:json_theme/json_theme_schemas.dart';

class LimitedBoxSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/limited_box';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'LimitedBoxBuilder',
    'additionalProperties': false,
    'properties': {
      'maxHeight': SchemaHelper.numberSchema,
      'maxWidth': SchemaHelper.numberSchema,
    }
  };
}

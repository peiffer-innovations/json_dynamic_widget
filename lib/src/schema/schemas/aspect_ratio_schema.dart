import 'package:json_theme/json_theme_schemas.dart';

class AspectRatioSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/aspect_ratio';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AspectRatioBuilder',
    'additionalProperties': false,
    'required': [
      'aspectRatio',
    ],
    'properties': {
      'aspectRatio': SchemaHelper.numberSchema,
    }
  };
}

import 'package:json_theme/json_theme_schemas.dart';

class ClipRectSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/clip_rect';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ClipRectBuilder',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
        },
      },
    ],
  };
}

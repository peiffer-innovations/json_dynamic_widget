import 'package:json_theme/json_theme_schemas.dart';

class ClipRRectSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/clip_rrect';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'ClipRRectBuilder',
    'additionalProperties': false,
    'required': [
      'borderRadius',
    ],
    'properties': {
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
    },
  };
}

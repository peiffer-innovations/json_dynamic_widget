import 'package:json_theme/json_theme_schemas.dart';

class DecoratedBoxSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/decorated_box';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'DecoratedBoxBuilder',
    'additionalProperties': false,
    'required': [
      'decoration',
    ],
    'properties': {
      'decoration': SchemaHelper.objectSchema(BoxDecorationSchema.id),
      'position': SchemaHelper.objectSchema(DecorationPositionSchema.id),
    }
  };
}

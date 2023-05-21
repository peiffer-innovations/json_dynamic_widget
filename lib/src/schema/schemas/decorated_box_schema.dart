import 'package:json_theme/json_theme_schemas.dart';

class DecoratedBoxSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/decorated_box.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/DecoratedBox-class.html',
    'title': 'DecoratedBox',
    'additionalProperties': false,
    'required': [
      'decoration',
    ],
    'properties': {
      DecoratedBoxSchemaProperty.decoration: SchemaHelper.objectSchema(BoxDecorationSchema.id),
      DecoratedBoxSchemaProperty.position: SchemaHelper.objectSchema(DecorationPositionSchema.id),
    }
  };
}

class DecoratedBoxSchemaProperty {
  static const decoration = 'decoration';
  static const position = 'position';
}

import 'package:json_theme/json_theme_schemas.dart';

class FittedBoxSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/fitted_box.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/FittedBox-class.html',
    'title': 'FittedBox',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
          'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
          'fit': SchemaHelper.objectSchema(BoxFitSchema.id),
        },
      },
    ],
  };
}

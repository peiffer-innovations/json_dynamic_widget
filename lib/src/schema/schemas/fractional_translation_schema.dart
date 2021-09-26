import 'package:json_theme/json_theme_schemas.dart';

class FractionalTranslationSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/fractional_translation.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/FractionalTranslation-class.html',
    'type': 'object',
    'title': 'FractionalTranslation',
    'additionalProperties': false,
    'required': [
      'translation',
    ],
    'properties': {
      'transformHitTests': SchemaHelper.boolSchema,
      'translation': SchemaHelper.objectSchema(OffsetSchema.id),
    }
  };
}

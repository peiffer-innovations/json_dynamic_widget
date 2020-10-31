import 'package:json_theme/json_theme_schemas.dart';

class FractionalTranslationSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/fractional_translation';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'FractionalTranslationBuilder',
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

import 'package:json_theme/json_theme_schemas.dart';

class FormSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/form';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'FormBuilder',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'additionalProperties': false,
        'type': 'object',
        'properties': {
          'autovalidate': SchemaHelper.boolSchema,
          'autovalidateMode': SchemaHelper.objectSchema(
            AutovalidateModeSchema.id,
          ),
          'onChanged': SchemaHelper.stringSchema,
          'onWillPop': SchemaHelper.stringSchema,
        },
      },
    ],
  };
}

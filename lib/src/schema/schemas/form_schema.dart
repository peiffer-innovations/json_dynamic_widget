import 'package:json_theme/json_theme_schemas.dart';

class FormSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/form.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Form-class.html',
    'title': 'Form',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'additionalProperties': false,
        'type': 'object',
        'properties': {
          FormSchemaProperty.autovalidate: SchemaHelper.boolSchema,
          FormSchemaProperty.autovalidateMode: SchemaHelper.objectSchema(
            AutovalidateModeSchema.id,
          ),
          FormSchemaProperty.onChanged: SchemaHelper.stringSchema,
          FormSchemaProperty.onWillPop: SchemaHelper.stringSchema,
        },
      },
    ],
  };
}

class FormSchemaProperty {
  static const autovalidate = 'autovalidate';
  static const autovalidateMode = 'autovalidateMode';
  static const onChanged = 'onChanged';
  static const onWillPop = 'onWillPop';
}

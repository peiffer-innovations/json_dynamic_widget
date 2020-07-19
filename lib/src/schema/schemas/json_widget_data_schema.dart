import 'package:json_theme/json_theme_schemas.dart';

class JsonWidgetDataSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/json_widget_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'JsonWidgetDataBuilder',
    'oneOf': [
      {
        'type': 'string',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'required': [
          'type',
        ],
        'properties': {
          'args': {
            'type': 'object',
            'additionalProperties': true,
          },
          'child': SchemaHelper.anySchema,
          'children': {
            'type': 'array',
            'items': SchemaHelper.anySchema,
          },
          'id': {
            'type': 'string',
          },
          'type': {
            'type': 'string',
          },
        },
      },
    ],
  };
}

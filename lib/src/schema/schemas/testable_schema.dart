import 'package:json_theme/json_theme_schemas.dart';

class TestableSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/testable.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/automated_testing_framework/latest/widgets/Testable-class.html',
    'title': 'Testable',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          'onRequestError': SchemaHelper.stringSchema,
          'onRequestValue': SchemaHelper.stringSchema,
          'onSetValue': SchemaHelper.stringSchema,
          'scrollableId': SchemaHelper.stringSchema,
        },
      },
    ],
  };
}

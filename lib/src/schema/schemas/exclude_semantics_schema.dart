import 'package:json_theme/json_theme_schemas.dart';

class ExcludeSemanticsSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/exclude_semantics.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/ExcludeSemantics-class.html',
    'type': 'object',
    'title': 'ExcludeSemantics',
    'additionalProperties': false,
    'properties': {
      'excluding': SchemaHelper.boolSchema,
    }
  };
}

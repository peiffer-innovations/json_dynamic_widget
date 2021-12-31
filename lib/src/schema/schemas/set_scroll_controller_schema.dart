import 'package:json_theme/json_theme_schemas.dart';

class SetScrollControllerSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/set_scroll_controller.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/ScrollController-class.html',
    'type': 'object',
    'title': 'SetScrollController',
    'additionalProperties': false,
    'properties': {
      'debugLabel': SchemaHelper.stringSchema,
      'initialScrollOffset': SchemaHelper.numberSchema,
      'keepScrollOffset': SchemaHelper.boolSchema,
      'key': SchemaHelper.stringSchema,
    }
  };
}

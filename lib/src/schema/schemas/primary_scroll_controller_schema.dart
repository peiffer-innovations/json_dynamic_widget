import 'package:json_theme/json_theme_schemas.dart';

class PrimaryScrollControllerSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/primary_scroll_controller.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/PrimaryScrollController-class.html',
    'type': 'object',
    'title': 'PrimaryScrollController',
    'additionalProperties': false,
    'properties': {
      'controller': SchemaHelper.stringSchema,
      'debugLabel': SchemaHelper.stringSchema,
      'initialScrollOffset': SchemaHelper.numberSchema,
      'keepScrollOffset': SchemaHelper.boolSchema,
    }
  };
}

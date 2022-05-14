import 'package:json_theme/json_theme_schemas.dart';

class ScrollConfigurationSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/scroll_configuration.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/ScrollConfiguration-class.html',
    'title': 'ScrollConfiguration',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dragDevices': SchemaHelper.stringSchema,
      'overscroll': SchemaHelper.boolSchema,
      'physics': SchemaHelper.objectSchema(ScrollPhysicsSchema.id),
      'platform': SchemaHelper.objectSchema(TargetPlatformSchema.id),
      'scrollbars': SchemaHelper.boolSchema,
    }
  };
}

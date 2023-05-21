import 'package:json_theme/json_theme_schemas.dart';

class ScrollConfigurationSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/scroll_configuration.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/ScrollConfiguration-class.html',
    'title': 'ScrollConfiguration',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      ScrollConfigurationSchemaProperty.dragDevices: SchemaHelper.stringSchema,
      ScrollConfigurationSchemaProperty.overscroll: SchemaHelper.boolSchema,
      ScrollConfigurationSchemaProperty.physics: SchemaHelper.objectSchema(ScrollPhysicsSchema.id),
      ScrollConfigurationSchemaProperty.platform:
          SchemaHelper.objectSchema(TargetPlatformSchema.id),
      ScrollConfigurationSchemaProperty.scrollbars: SchemaHelper.boolSchema,
    }
  };
}

class ScrollConfigurationSchemaProperty {
  static const dragDevices = 'dragDevices';
  static const overscroll = 'overscroll';
  static const physics = 'physics';
  static const platform = 'platform';
  static const scrollbars = 'scrollbars';
}

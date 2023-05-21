import 'package:json_theme/json_theme_schemas.dart';

class PrimaryScrollControllerSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/primary_scroll_controller.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/PrimaryScrollController-class.html',
    'type': 'object',
    'title': 'PrimaryScrollController',
    'additionalProperties': false,
    'properties': {
      PrimaryScrollControllerSchemaProperty.automaticallyInheritForPlatforms:
          SchemaHelper.arraySchema(
        TargetPlatformSchema.id,
      ),
      PrimaryScrollControllerSchemaProperty.controller: SchemaHelper.stringSchema,
      PrimaryScrollControllerSchemaProperty.debugLabel: SchemaHelper.stringSchema,
      PrimaryScrollControllerSchemaProperty.initialScrollOffset: SchemaHelper.numberSchema,
      PrimaryScrollControllerSchemaProperty.keepScrollOffset: SchemaHelper.boolSchema,
      PrimaryScrollControllerSchemaProperty.scrollDirection:
          SchemaHelper.objectSchema(AxisSchema.id),
    }
  };
}

class PrimaryScrollControllerSchemaProperty {
  static const automaticallyInheritForPlatforms = 'automaticallyInheritForPlatforms';
  static const controller = 'controller';
  static const debugLabel = 'debugLabel';
  static const initialScrollOffset = 'initialScrollOffset';
  static const keepScrollOffset = 'keepScrollOffset';
  static const scrollDirection = 'scrollDirection';
}

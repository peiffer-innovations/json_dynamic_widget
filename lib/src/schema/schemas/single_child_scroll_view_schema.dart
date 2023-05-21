import 'package:json_theme/json_theme_schemas.dart';

class SingleChildScrollViewSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/single_child_scroll_view.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html',
    'title': 'SingleChildScrollView',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          SingleChildScrollViewSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
          SingleChildScrollViewSchemaProperty.controller: SchemaHelper.stringSchema,
          SingleChildScrollViewSchemaProperty.dragStartBehavior: SchemaHelper.objectSchema(DragStartBehaviorSchema.id,),
          SingleChildScrollViewSchemaProperty.keyboardDismissBehavior: SchemaHelper.objectSchema(ScrollViewKeyboardDismissBehaviorSchema.id,),
          SingleChildScrollViewSchemaProperty.padding: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          SingleChildScrollViewSchemaProperty.physics: SchemaHelper.objectSchema(ScrollPhysicsSchema.id),
          SingleChildScrollViewSchemaProperty.primary: SchemaHelper.boolSchema,
          SingleChildScrollViewSchemaProperty.restorationId: SchemaHelper.stringSchema,
          SingleChildScrollViewSchemaProperty.reverse: SchemaHelper.boolSchema,
          SingleChildScrollViewSchemaProperty.scrollDirection: SchemaHelper.objectSchema(AxisSchema.id),
        },
      },
    ],
  };
}

class SingleChildScrollViewSchemaProperty {
  static const clipBehavior = 'clipBehavior';
  static const controller = 'controller';
  static const dragStartBehavior = 'dragStartBehavior';
  static const keyboardDismissBehavior = 'keyboardDismissBehavior';
  static const padding = 'padding';
  static const physics = 'physics';
  static const primary = 'primary';
  static const restorationId = 'restorationId';
  static const reverse = 'reverse';
  static const scrollDirection = 'scrollDirection';
}
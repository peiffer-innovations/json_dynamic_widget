import 'package:json_theme/json_theme_schemas.dart';

class CustomScrollViewSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/custom_scroll_view.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html',
    'title': 'CustomScrollView',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      CustomScrollViewSchemaProperty.anchor: SchemaHelper.numberSchema,
      CustomScrollViewSchemaProperty.cacheExtent: SchemaHelper.numberSchema,
      CustomScrollViewSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
      CustomScrollViewSchemaProperty.center: SchemaHelper.stringSchema,
      CustomScrollViewSchemaProperty.controller: SchemaHelper.stringSchema,
      CustomScrollViewSchemaProperty.dragStartBehavior:
          SchemaHelper.objectSchema(DragStartBehaviorSchema.id),
      CustomScrollViewSchemaProperty.keyboardDismissBehavior:
          SchemaHelper.objectSchema(ScrollViewKeyboardDismissBehaviorSchema.id),
      CustomScrollViewSchemaProperty.padding:
          SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      CustomScrollViewSchemaProperty.physics: SchemaHelper.objectSchema(ScrollPhysicsSchema.id),
      CustomScrollViewSchemaProperty.primary: SchemaHelper.boolSchema,
      CustomScrollViewSchemaProperty.restorationId: SchemaHelper.stringSchema,
      CustomScrollViewSchemaProperty.reverse: SchemaHelper.boolSchema,
      CustomScrollViewSchemaProperty.scrollBehavior:
          SchemaHelper.objectSchema(ScrollBehaviorSchema.id),
      CustomScrollViewSchemaProperty.scrollDirection: SchemaHelper.objectSchema(AxisSchema.id),
      CustomScrollViewSchemaProperty.semanticChildCount: SchemaHelper.numberSchema,
      CustomScrollViewSchemaProperty.shrinkWrap: SchemaHelper.boolSchema,
    },
  };
}

class CustomScrollViewSchemaProperty {
  static const anchor = 'anchor';
  static const cacheExtent = 'cacheExtent';
  static const clipBehavior = 'clipBehavior';
  static const center = 'center';
  static const controller = 'controller';
  static const dragStartBehavior = 'dragStartBehavior';
  static const keyboardDismissBehavior = 'keyboardDismissBehavior';
  static const padding = 'padding';
  static const physics = 'physics';
  static const primary = 'primary';
  static const restorationId = 'restorationId';
  static const reverse = 'reverse';
  static const scrollBehavior = 'scrollBehavior';
  static const scrollDirection = 'scrollDirection';
  static const semanticChildCount = 'semanticChildCount';
  static const shrinkWrap = 'shrinkWrap';
}

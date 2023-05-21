import 'package:json_theme/json_theme_schemas.dart';

class GridViewSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/grid_view.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': -1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/GridView-class.html',
    'title': 'GridView',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          GridViewSchemaProperty.addAutomaticKeepAlives: SchemaHelper.boolSchema,
          GridViewSchemaProperty.addRepaintBoundaries: SchemaHelper.boolSchema,
          GridViewSchemaProperty.addSemanticIndexes: SchemaHelper.boolSchema,
          GridViewSchemaProperty.cacheExtent: SchemaHelper.numberSchema,
          GridViewSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
          GridViewSchemaProperty.controller: SchemaHelper.stringSchema,
          GridViewSchemaProperty.dragStartBehavior: SchemaHelper.objectSchema(
            DragStartBehaviorSchema.id,
          ),
          GridViewSchemaProperty.findChildIndexCallback: SchemaHelper.stringSchema,
          GridViewSchemaProperty.gridDelegate: SchemaHelper.anySchema,
          GridViewSchemaProperty.keyboardDismissBehavior: SchemaHelper.objectSchema(
            ScrollViewKeyboardDismissBehaviorSchema.id,
          ),
          GridViewSchemaProperty.padding: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          GridViewSchemaProperty.physics: SchemaHelper.objectSchema(ScrollPhysicsSchema.id),
          GridViewSchemaProperty.primary: SchemaHelper.boolSchema,
          GridViewSchemaProperty.restorationId: SchemaHelper.stringSchema,
          GridViewSchemaProperty.reverse: SchemaHelper.boolSchema,
          GridViewSchemaProperty.scrollDirection: SchemaHelper.objectSchema(AxisSchema.id),
          GridViewSchemaProperty.semanticChildCount: SchemaHelper.numberSchema,
          GridViewSchemaProperty.shrinkWrap: SchemaHelper.boolSchema,
        },
      },
    ],
  };
}

class GridViewSchemaProperty {
  static const addAutomaticKeepAlives = 'addAutomaticKeepAlives';
  static const addRepaintBoundaries = 'addRepaintBoundaries';
  static const addSemanticIndexes = 'addSemanticIndexes';
  static const cacheExtent = 'cacheExtent';
  static const clipBehavior = 'clipBehavior';
  static const controller = 'controller';
  static const dragStartBehavior = 'dragStartBehavior';
  static const findChildIndexCallback = 'findChildIndexCallback';
  static const gridDelegate = 'gridDelegate';
  static const keyboardDismissBehavior = 'keyboardDismissBehavior';
  static const padding = 'padding';
  static const physics = 'physics';
  static const primary = 'primary';
  static const restorationId = 'restorationId';
  static const reverse = 'reverse';
  static const scrollDirection = 'scrollDirection';
  static const semanticChildCount = 'semanticChildCount';
  static const shrinkWrap = 'shrinkWrap';
}

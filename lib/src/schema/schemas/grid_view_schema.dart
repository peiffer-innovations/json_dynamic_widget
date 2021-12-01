import 'package:json_theme/json_theme_schemas.dart';

class GridViewSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/grid_view.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/GridView-class.html',
    'title': 'ListView',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          'addAutomaticKeepAlives': SchemaHelper.boolSchema,
          'addRepaintBoundaries': SchemaHelper.boolSchema,
          'addSemanticIndexes': SchemaHelper.boolSchema,
          'cacheExtent': SchemaHelper.numberSchema,
          'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
          'controller': SchemaHelper.stringSchema,
          'dragStartBehavior':
              SchemaHelper.objectSchema(DragStartBehaviorSchema.id),
          'gridDelegate': SchemaHelper.anySchema,
          'itemExtent': SchemaHelper.numberSchema,
          'keyboardDismissBehavior': SchemaHelper.objectSchema(
            ScrollViewKeyboardDismissBehaviorSchema.id,
          ),
          'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'physics': SchemaHelper.objectSchema(ScrollPhysicsSchema.id),
          'primary': SchemaHelper.boolSchema,
          'restorationId': SchemaHelper.stringSchema,
          'reverse': SchemaHelper.boolSchema,
          'scrollDirection': SchemaHelper.objectSchema(AxisSchema.id),
          'shrinkWrap': SchemaHelper.boolSchema,
        },
      },
    ],
  };
}

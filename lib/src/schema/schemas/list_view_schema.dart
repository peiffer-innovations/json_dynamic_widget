import 'package:json_theme/json_theme_schemas.dart';

class ListViewSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/list_view';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ListViewBuilder',
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

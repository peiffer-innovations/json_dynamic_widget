import 'package:json_theme/json_theme_schemas.dart';

class SingleChildScrollViewSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/single_child_scroll_view.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
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
          'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
          'controller': SchemaHelper.stringSchema,
          'dragStartBehavior': SchemaHelper.objectSchema(
            DragStartBehaviorSchema.id,
          ),
          'keyboardDismissBehavior': SchemaHelper.objectSchema(
            ScrollViewKeyboardDismissBehaviorSchema.id,
          ),
          'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'physics': SchemaHelper.objectSchema(ScrollPhysicsSchema.id),
          'primary': SchemaHelper.boolSchema,
          'restorationId': SchemaHelper.stringSchema,
          'reverse': SchemaHelper.boolSchema,
          'scrollDirection': SchemaHelper.objectSchema(AxisSchema.id),
        },
      },
    ],
  };
}

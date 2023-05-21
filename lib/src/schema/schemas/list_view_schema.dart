import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
import 'package:json_theme/json_theme_schemas.dart';

class ListViewSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/list_view.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': -1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/ListView-class.html',
    'title': 'ListView',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          ListViewSchemaProperty.addAutomaticKeepAlives: SchemaHelper.boolSchema,
          ListViewSchemaProperty.addRepaintBoundaries: SchemaHelper.boolSchema,
          ListViewSchemaProperty.addSemanticIndexes: SchemaHelper.boolSchema,
          ListViewSchemaProperty.cacheExtent: SchemaHelper.numberSchema,
          ListViewSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
          ListViewSchemaProperty.controller: SchemaHelper.stringSchema,
          ListViewSchemaProperty.dragStartBehavior: SchemaHelper.objectSchema(
            DragStartBehaviorSchema.id,
          ),
          ListViewSchemaProperty.findChildIndexCallback: SchemaHelper.stringSchema,
          ListViewSchemaProperty.itemExtent: SchemaHelper.numberSchema,
          ListViewSchemaProperty.keyboardDismissBehavior: SchemaHelper.objectSchema(
            ScrollViewKeyboardDismissBehaviorSchema.id,
          ),
          ListViewSchemaProperty.padding: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          ListViewSchemaProperty.physics: SchemaHelper.objectSchema(ScrollPhysicsSchema.id),
          ListViewSchemaProperty.primary: SchemaHelper.boolSchema,
          ListViewSchemaProperty.prototypeItem: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
          ListViewSchemaProperty.restorationId: SchemaHelper.stringSchema,
          ListViewSchemaProperty.reverse: SchemaHelper.boolSchema,
          ListViewSchemaProperty.scrollDirection: SchemaHelper.objectSchema(AxisSchema.id),
          ListViewSchemaProperty.shrinkWrap: SchemaHelper.boolSchema,
        },
      },
    ],
  };
}

class ListViewSchemaProperty {
  static const addAutomaticKeepAlives = 'addAutomaticKeepAlives';
  static const addRepaintBoundaries = 'addRepaintBoundaries';
  static const addSemanticIndexes = 'addSemanticIndexes';
  static const cacheExtent = 'cacheExtent';
  static const clipBehavior = 'clipBehavior';
  static const controller = 'controller';
  static const dragStartBehavior = 'dragStartBehavior';
  static const findChildIndexCallback = 'findChildIndexCallback';
  static const itemExtent = 'itemExtent';
  static const keyboardDismissBehavior = 'keyboardDismissBehavior';
  static const padding = 'padding';
  static const physics = 'physics';
  static const primary = 'primary';
  static const prototypeItem = 'prototypeItem';
  static const restorationId = 'restorationId';
  static const reverse = 'reverse';
  static const scrollDirection = 'scrollDirection';
  static const shrinkWrap = 'shrinkWrap';
}

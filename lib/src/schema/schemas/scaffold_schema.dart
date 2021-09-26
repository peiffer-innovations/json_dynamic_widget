import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
import 'package:json_theme/json_theme_schemas.dart';

class ScaffoldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/scaffold.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/material/Scaffold-class.html',
    'type': 'object',
    'title': 'Scaffold',
    'additionalProperties': false,
    'properties': {
      'appBar': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'body': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'bottomNavigationBar': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'bottomSheet': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'drawer': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'drawerDragStartBehavior':
          SchemaHelper.objectSchema(DragStartBehaviorSchema.id),
      'drawerEdgeDragWidth': SchemaHelper.numberSchema,
      'drawerEnableOpenDragGesture': SchemaHelper.boolSchema,
      'drawerScrimColor': SchemaHelper.objectSchema(ColorSchema.id),
      'endDrawer': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'endDrawerEnableOpenDragGesture': SchemaHelper.boolSchema,
      'extendBody': SchemaHelper.boolSchema,
      'extendBodyBehindAppBar': SchemaHelper.boolSchema,
      'floatingActionButton':
          SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'floatingActionButtonAnimator': SchemaHelper.objectSchema(
        FloatingActionButtonAnimatorSchema.id,
      ),
      'floatingActionButtonLocation': SchemaHelper.objectSchema(
        FloatingActionButtonLocationSchema.id,
      ),
      'persistentFooterButtons': SchemaHelper.arraySchema(
        JsonWidgetDataSchema.id,
      ),
      'onDrawerChanged': SchemaHelper.stringSchema,
      'onEndDrawerChanged': SchemaHelper.stringSchema,
      'primary': SchemaHelper.boolSchema,
      'resizeToAvoidBottomInset': SchemaHelper.boolSchema,
      'restorationId': SchemaHelper.stringSchema,
    },
  };
}

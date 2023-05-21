import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
import 'package:json_theme/json_theme_schemas.dart';

class ScaffoldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/scaffold.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/material/Scaffold-class.html',
    'type': 'object',
    'title': 'Scaffold',
    'additionalProperties': false,
    'properties': {
      ScaffoldSchemaProperty.appBar: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      ScaffoldSchemaProperty.backgroundColor: SchemaHelper.objectSchema(ColorSchema.id),
      ScaffoldSchemaProperty.body: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      ScaffoldSchemaProperty.bottomNavigationBar:
          SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      ScaffoldSchemaProperty.bottomSheet: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      ScaffoldSchemaProperty.drawer: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      ScaffoldSchemaProperty.drawerDragStartBehavior:
          SchemaHelper.objectSchema(DragStartBehaviorSchema.id),
      ScaffoldSchemaProperty.drawerEdgeDragWidth: SchemaHelper.numberSchema,
      ScaffoldSchemaProperty.drawerEnableOpenDragGesture: SchemaHelper.boolSchema,
      ScaffoldSchemaProperty.drawerScrimColor: SchemaHelper.objectSchema(ColorSchema.id),
      ScaffoldSchemaProperty.endDrawer: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      ScaffoldSchemaProperty.endDrawerEnableOpenDragGesture: SchemaHelper.boolSchema,
      ScaffoldSchemaProperty.extendBody: SchemaHelper.boolSchema,
      ScaffoldSchemaProperty.extendBodyBehindAppBar: SchemaHelper.boolSchema,
      ScaffoldSchemaProperty.floatingActionButton:
          SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      ScaffoldSchemaProperty.floatingActionButtonAnimator: SchemaHelper.objectSchema(
        FloatingActionButtonAnimatorSchema.id,
      ),
      ScaffoldSchemaProperty.floatingActionButtonLocation: SchemaHelper.objectSchema(
        FloatingActionButtonLocationSchema.id,
      ),
      ScaffoldSchemaProperty.onDrawerChanged: SchemaHelper.stringSchema,
      ScaffoldSchemaProperty.onEndDrawerChanged: SchemaHelper.stringSchema,
      ScaffoldSchemaProperty.persistentFooterAlignment: SchemaHelper.objectSchema(
        AlignmentDirectionalSchema.id,
      ),
      ScaffoldSchemaProperty.persistentFooterButtons: SchemaHelper.arraySchema(
        JsonWidgetDataSchema.id,
      ),
      ScaffoldSchemaProperty.primary: SchemaHelper.boolSchema,
      ScaffoldSchemaProperty.resizeToAvoidBottomInset: SchemaHelper.boolSchema,
      ScaffoldSchemaProperty.restorationId: SchemaHelper.stringSchema,
    },
  };
}

class ScaffoldSchemaProperty {
  static const appBar = 'appBar';
  static const backgroundColor = 'backgroundColor';
  static const body = 'body';
  static const bottomNavigationBar = 'bottomNavigationBar';
  static const bottomSheet = 'bottomSheet';
  static const drawer = 'drawer';
  static const drawerDragStartBehavior = 'drawerDragStartBehavior';
  static const drawerEdgeDragWidth = 'drawerEdgeDragWidth';
  static const drawerEnableOpenDragGesture = 'drawerEnableOpenDragGesture';
  static const drawerScrimColor = 'drawerScrimColor';
  static const endDrawer = 'endDrawer';
  static const endDrawerEnableOpenDragGesture = 'endDrawerEnableOpenDragGesture';
  static const extendBody = 'extendBody';
  static const extendBodyBehindAppBar = 'extendBodyBehindAppBar';
  static const floatingActionButton = 'floatingActionButton';
  static const floatingActionButtonAnimator = 'floatingActionButtonAnimator';
  static const floatingActionButtonLocation = 'floatingActionButtonLocation';
  static const onDrawerChanged = 'onDrawerChanged';
  static const onEndDrawerChanged = 'onEndDrawerChanged';
  static const persistentFooterAlignment = 'persistentFooterAlignment';
  static const persistentFooterButtons = 'persistentFooterButtons';
  static const primary = 'primary';
  static const resizeToAvoidBottomInset = 'resizeToAvoidBottomInset';
  static const restorationId = 'restorationId';
}

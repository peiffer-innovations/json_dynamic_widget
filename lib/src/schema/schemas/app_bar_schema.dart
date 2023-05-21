import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
import 'package:json_theme/json_theme_schemas.dart';

class AppBarSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/app_bar.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 0,
    r'$comment': 'https://api.flutter.dev/flutter/material/AppBar-class.html',
    'type': 'object',
    'title': 'AppBar',
    'additionalProperties': false,
    'properties': {
      AppBarSchemaProperty.actions: SchemaHelper.arraySchema(JsonWidgetDataSchema.id),
      AppBarSchemaProperty.actionsIconTheme: SchemaHelper.objectSchema(IconThemeDataSchema.id),
      AppBarSchemaProperty.automaticallyImplyLeading: SchemaHelper.boolSchema,
      AppBarSchemaProperty.backgroundColor: SchemaHelper.objectSchema(ColorSchema.id),
      AppBarSchemaProperty.bottom: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      AppBarSchemaProperty.bottomOpacity: SchemaHelper.numberSchema,
      AppBarSchemaProperty.centerTitle: SchemaHelper.boolSchema,
      AppBarSchemaProperty.elevation: SchemaHelper.numberSchema,
      AppBarSchemaProperty.excludeHeaderSemantics: SchemaHelper.boolSchema,
      AppBarSchemaProperty.flexibleSpace: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      AppBarSchemaProperty.foregroundColor: SchemaHelper.objectSchema(ColorSchema.id),
      AppBarSchemaProperty.iconTheme: SchemaHelper.objectSchema(IconThemeDataSchema.id),
      AppBarSchemaProperty.leading: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      AppBarSchemaProperty.leadingWidth: SchemaHelper.numberSchema,
      AppBarSchemaProperty.notificationPredicate: SchemaHelper.stringSchema,
      AppBarSchemaProperty.primary: SchemaHelper.boolSchema,
      AppBarSchemaProperty.scrolledUnderElevation: SchemaHelper.boolSchema,
      AppBarSchemaProperty.shadowColor: SchemaHelper.objectSchema(ColorSchema.id),
      AppBarSchemaProperty.shape: SchemaHelper.objectSchema(ShapeBorderSchema.id),
      AppBarSchemaProperty.surfaceTintColor: SchemaHelper.objectSchema(ColorSchema.id),
      AppBarSchemaProperty.systemOverlayStyle: SchemaHelper.objectSchema(
        SystemUiOverlayStyleSchema.id,
      ),
      AppBarSchemaProperty.titleTextStyle: SchemaHelper.objectSchema(TextStyleSchema.id),
      AppBarSchemaProperty.toolbarTextStyle: SchemaHelper.objectSchema(TextStyleSchema.id),
      AppBarSchemaProperty.title: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      AppBarSchemaProperty.titleSpacing: SchemaHelper.numberSchema,
      AppBarSchemaProperty.toolbarHeight: SchemaHelper.numberSchema,
      AppBarSchemaProperty.toolbarOpacity: SchemaHelper.numberSchema,
    },
  };
}

class AppBarSchemaProperty {
  static const actions = 'actions';
  static const actionsIconTheme = 'actionsIconTheme';
  static const automaticallyImplyLeading = 'automaticallyImplyLeading';
  static const backgroundColor = 'backgroundColor';
  static const bottom = 'bottom';
  static const bottomOpacity = 'bottomOpacity';
  static const centerTitle = 'centerTitle';
  static const elevation = 'elevation';
  static const excludeHeaderSemantics = 'excludeHeaderSemantics';
  static const flexibleSpace = 'flexibleSpace';
  static const foregroundColor = 'foregroundColor';
  static const iconTheme = 'iconTheme';
  static const leading = 'leading';
  static const leadingWidth = 'leadingWidth';
  static const notificationPredicate = 'notificationPredicate';
  static const primary = 'primary';
  static const scrolledUnderElevation = 'scrolledUnderElevation';
  static const shadowColor = 'shadowColor';
  static const shape = 'shape';
  static const surfaceTintColor = 'surfaceTintColor';
  static const systemOverlayStyle = 'systemOverlayStyle';
  static const titleTextStyle = 'titleTextStyle';
  static const toolbarTextStyle = 'toolbarTextStyle';
  static const title = 'title';
  static const titleSpacing = 'titleSpacing';
  static const toolbarHeight = 'toolbarHeight';
  static const toolbarOpacity = 'toolbarOpacity';
}

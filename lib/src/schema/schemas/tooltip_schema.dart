import 'package:json_theme/json_theme_schemas.dart';

class TooltipSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/tooltip.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/material/Tooltip-class.html',
    'type': 'object',
    'title': 'Text',
    'additionalProperties': false,
    'required': [
      'message',
    ],
    'properties': {
      TooltipSchemaProperty.decoration: SchemaHelper.objectSchema(BoxDecorationSchema.id),
      TooltipSchemaProperty.enableFeedback: SchemaHelper.boolSchema,
      TooltipSchemaProperty.excludeFromSemantics: SchemaHelper.boolSchema,
      TooltipSchemaProperty.height: SchemaHelper.numberSchema,
      TooltipSchemaProperty.margin: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      TooltipSchemaProperty.message: SchemaHelper.stringSchema,
      TooltipSchemaProperty.onTriggered: SchemaHelper.stringSchema,
      TooltipSchemaProperty.padding: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      TooltipSchemaProperty.preferBelow: SchemaHelper.boolSchema,
      TooltipSchemaProperty.richMessage: SchemaHelper.stringSchema,
      TooltipSchemaProperty.showDuration: SchemaHelper.numberSchema,
      TooltipSchemaProperty.textAlign: SchemaHelper.objectSchema(TextAlignSchema.id),
      TooltipSchemaProperty.textStyle: SchemaHelper.objectSchema(TextStyleSchema.id),
      TooltipSchemaProperty.triggerMode: SchemaHelper.boolSchema,
      TooltipSchemaProperty.verticalOffset: SchemaHelper.numberSchema,
      TooltipSchemaProperty.waitDuration: SchemaHelper.numberSchema,
    }
  };
}

class TooltipSchemaProperty {
  static const decoration = 'decoration';
  static const enableFeedback = 'enableFeedback';
  static const excludeFromSemantics = 'excludeFromSemantics';
  static const height = 'height';
  static const margin = 'margin';
  static const message = 'message';
  static const onTriggered = 'onTriggered';
  static const padding = 'padding';
  static const preferBelow = 'preferBelow';
  static const richMessage = 'richMessage';
  static const showDuration = 'showDuration';
  static const textAlign = 'textAlign';
  static const textStyle = 'textStyle';
  static const triggerMode = 'triggerMode';
  static const verticalOffset = 'verticalOffset';
  static const waitDuration = 'waitDuration';
}

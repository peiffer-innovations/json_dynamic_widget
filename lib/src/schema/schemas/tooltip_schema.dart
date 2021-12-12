import 'package:json_theme/json_theme_schemas.dart';

class TooltipSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/tooltip.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/material/Tooltip-class.html',
    'type': 'object',
    'title': 'Text',
    'additionalProperties': false,
    'required': [
      'message',
    ],
    'properties': {
      'decoration': SchemaHelper.objectSchema(BoxDecorationSchema.id),
      'enableFeedback': SchemaHelper.boolSchema,
      'excludeFromSemantics': SchemaHelper.boolSchema,
      'height': SchemaHelper.numberSchema,
      'margin': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'message': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'preferBelow': SchemaHelper.boolSchema,
      'richMessage': SchemaHelper.stringSchema,
      'showDuration': SchemaHelper.numberSchema,
      'textStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'triggerMode': SchemaHelper.boolSchema,
      'verticalOffset': SchemaHelper.numberSchema,
      'waitDuration': SchemaHelper.numberSchema,
    }
  };
}

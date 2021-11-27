import 'package:json_theme/json_theme_schemas.dart';

class WrapSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/wrap.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Wrap-class.html',
    'type': 'object',
    'title': 'Wrap',
    'additionalProperties': false,
    'properties': {
      'alignment': SchemaHelper.objectSchema(WrapAlignmentSchema.id),
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'crossAxisAlignment':
          SchemaHelper.objectSchema(WrapCrossAlignmentSchema.id),
      'direction': SchemaHelper.objectSchema(AxisSchema.id),
      'runAlignment': SchemaHelper.objectSchema(WrapAlignmentSchema.id),
      'runSpacing': SchemaHelper.numberSchema,
      'spacing': SchemaHelper.numberSchema,
      'textDirection': SchemaHelper.objectSchema(TextDirectionSchema.id)
    },
  };
}

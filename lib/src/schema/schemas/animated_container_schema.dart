import 'package:json_theme/json_theme_schemas.dart';

class AnimatedContainerSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_container.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html',
    'title': 'AnimatedContainer',
    'required': [
      'duration',
    ],
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'constraints': SchemaHelper.objectSchema(BoxConstraintsSchema.id),
      'curve': SchemaHelper.stringSchema,
      'decoration': SchemaHelper.objectSchema(BoxDecorationSchema.id),
      'duration': SchemaHelper.numberSchema,
      'foregroundDecoration': SchemaHelper.objectSchema(BoxDecorationSchema.id),
      'height': SchemaHelper.numberSchema,
      'margin': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'onEnd': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'transform': SchemaHelper.objectSchema(Matrix4Schema.id),
      'transformAlignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'width': SchemaHelper.numberSchema,
    },
  };
}

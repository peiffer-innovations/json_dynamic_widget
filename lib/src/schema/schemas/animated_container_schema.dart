import 'package:json_theme/json_theme_schemas.dart';

class AnimatedContainerSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/animated_container';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'AnimatedContainerBuilder',
    'required': [
      'duration',
    ],
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
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
      'width': SchemaHelper.numberSchema,
    },
  };
}

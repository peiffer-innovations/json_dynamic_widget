import 'package:json_theme/json_theme_schemas.dart';

class ContainerSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/container.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Container-class.html',
    'title': 'Container',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
          'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
          'color': SchemaHelper.objectSchema(ColorSchema.id),
          'constraints': SchemaHelper.objectSchema(BoxConstraintsSchema.id),
          'decoration': SchemaHelper.objectSchema(BoxDecorationSchema.id),
          'foregroundDecoration':
              SchemaHelper.objectSchema(BoxDecorationSchema.id),
          'height': SchemaHelper.numberSchema,
          'margin': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'transform': SchemaHelper.objectSchema(Matrix4Schema.id),
          'transformAlignment': SchemaHelper.objectSchema(AlignmentSchema.id),
          'width': SchemaHelper.numberSchema,
        },
      },
    ],
  };
}

import 'package:json_theme/json_theme_schemas.dart';

class InteractiveViewerSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/interactive_viewer.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/InteractiveViewer-class.html',
    'type': 'object',
    'title': 'InteractiveViewer',
    'additionalProperties': false,
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'boundaryMargin': SchemaHelper.objectSchema(
        EdgeInsetsGeometrySchema.id,
      ),
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'constrained': SchemaHelper.boolSchema,
      'interactionEndFrictionCoefficient': SchemaHelper.numberSchema,
      'maxScale': SchemaHelper.numberSchema,
      'minScale': SchemaHelper.numberSchema,
      'onInteractionEnd': SchemaHelper.stringSchema,
      'onInteractionStart': SchemaHelper.stringSchema,
      'onInteractionUpdate': SchemaHelper.stringSchema,
      'panAxis': SchemaHelper.objectSchema(PanAxisSchema.id),
      'panEnabled': SchemaHelper.boolSchema,
      'scaleEnabled': SchemaHelper.boolSchema,
      'scaleFactor': SchemaHelper.numberSchema,
      'transformationController': SchemaHelper.stringSchema,
    }
  };
}

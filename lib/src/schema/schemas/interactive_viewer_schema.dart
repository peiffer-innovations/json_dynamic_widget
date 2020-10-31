import 'package:json_theme/json_theme_schemas.dart';

class InteractiveViewerSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/interactive_viewer';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'InteractiveViewerBuilder',
    'additionalProperties': false,
    'properties': {
      'alignPanAxis': SchemaHelper.boolSchema,
      'boundaryMargin': SchemaHelper.objectSchema(
        EdgeInsetsGeometrySchema.id,
      ),
      'constrained': SchemaHelper.boolSchema,
      'maxScale': SchemaHelper.numberSchema,
      'minScale': SchemaHelper.numberSchema,
      'onInteractionEnd': SchemaHelper.stringSchema,
      'onInteractionStart': SchemaHelper.stringSchema,
      'onInteractionUpdate': SchemaHelper.stringSchema,
      'panEnabled': SchemaHelper.boolSchema,
      'scaleEnabled': SchemaHelper.boolSchema,
      'transformationController': SchemaHelper.stringSchema,
    }
  };
}

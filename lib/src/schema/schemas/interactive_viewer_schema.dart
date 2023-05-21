import 'package:json_theme/json_theme_schemas.dart';

class InteractiveViewerSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/interactive_viewer.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/InteractiveViewer-class.html',
    'type': 'object',
    'title': 'InteractiveViewer',
    'additionalProperties': false,
    'properties': {
      InteractiveViewerSchemaProperty.alignment: SchemaHelper.objectSchema(AlignmentSchema.id),
      InteractiveViewerSchemaProperty.boundaryMargin: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      InteractiveViewerSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
      InteractiveViewerSchemaProperty.constrained: SchemaHelper.boolSchema,
      InteractiveViewerSchemaProperty.interactionEndFrictionCoefficient: SchemaHelper.numberSchema,
      InteractiveViewerSchemaProperty.maxScale: SchemaHelper.numberSchema,
      InteractiveViewerSchemaProperty.minScale: SchemaHelper.numberSchema,
      InteractiveViewerSchemaProperty.onInteractionEnd: SchemaHelper.stringSchema,
      InteractiveViewerSchemaProperty.onInteractionStart: SchemaHelper.stringSchema,
      InteractiveViewerSchemaProperty.onInteractionUpdate: SchemaHelper.stringSchema,
      InteractiveViewerSchemaProperty.panAxis: SchemaHelper.objectSchema(PanAxisSchema.id),
      InteractiveViewerSchemaProperty.panEnabled: SchemaHelper.boolSchema,
      InteractiveViewerSchemaProperty.scaleEnabled: SchemaHelper.boolSchema,
      InteractiveViewerSchemaProperty.scaleFactor: SchemaHelper.numberSchema,
      InteractiveViewerSchemaProperty.transformationController: SchemaHelper.stringSchema,
    }
  };
}

class InteractiveViewerSchemaProperty {
  static const alignment = 'alignment';
  static const boundaryMargin = 'boundaryMargin';
  static const clipBehavior = 'clipBehavior';
  static const constrained = 'constrained';
  static const interactionEndFrictionCoefficient =
      'interactionEndFrictionCoefficient';
  static const maxScale = 'maxScale';
  static const minScale = 'minScale';
  static const onInteractionEnd = 'onInteractionEnd';
  static const onInteractionStart = 'onInteractionStart';
  static const onInteractionUpdate = 'onInteractionUpdate';
  static const panAxis = 'panAxis';
  static const panEnabled = 'panEnabled';
  static const scaleEnabled = 'scaleEnabled';
  static const scaleFactor = 'scaleFactor';
  static const transformationController = 'transformationController';
}
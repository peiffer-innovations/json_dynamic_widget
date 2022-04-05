import 'package:json_theme/json_theme_schemas.dart';

class AssetImageSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/asset_image.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/painting/AssetImage-class.html',
    'type': 'object',
    'title': 'AssetImage',
    'required': [
      'name',
    ],
    'additionalProperties': false,
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'cacheHeight': SchemaHelper.numberSchema,
      'cacheWidth': SchemaHelper.numberSchema,
      'centerSlice': SchemaHelper.objectSchema(RectSchema.id),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'colorBlendMode': SchemaHelper.objectSchema(BlendModeSchema.id),
      'errorBuilder': SchemaHelper.stringSchema,
      'excludeFromSemantics': SchemaHelper.boolSchema,
      'filterQuality': SchemaHelper.objectSchema(FilterQualitySchema.id),
      'fit': SchemaHelper.objectSchema(BoxFitSchema.id),
      'frameBuilder': SchemaHelper.stringSchema,
      'gaplessPlatback': SchemaHelper.boolSchema,
      'height': SchemaHelper.numberSchema,
      'isAntiAlias': SchemaHelper.boolSchema,
      'matchTextDirection': SchemaHelper.boolSchema,
      'name': SchemaHelper.stringSchema,
      'opacity': SchemaHelper.numberSchema,
      'package': SchemaHelper.stringSchema,
      'repeat': SchemaHelper.objectSchema(ImageRepeatSchema.id),
      'scale': SchemaHelper.numberSchema,
      'semanticLabel': SchemaHelper.stringSchema,
      'width': SchemaHelper.numberSchema,
    }
  };
}

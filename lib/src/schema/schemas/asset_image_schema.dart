import 'package:json_theme/json_theme_schemas.dart';

class AssetImageSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/asset_image.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 0,
    r'$comment': 'https://api.flutter.dev/flutter/painting/AssetImage-class.html',
    'type': 'object',
    'title': 'AssetImage',
    'required': [
      'name',
    ],
    'additionalProperties': false,
    'properties': {
      AssetImageSchemaProperty.alignment: SchemaHelper.objectSchema(AlignmentSchema.id),
      AssetImageSchemaProperty.cacheHeight: SchemaHelper.numberSchema,
      AssetImageSchemaProperty.cacheWidth: SchemaHelper.numberSchema,
      AssetImageSchemaProperty.centerSlice: SchemaHelper.objectSchema(RectSchema.id),
      AssetImageSchemaProperty.color: SchemaHelper.objectSchema(ColorSchema.id),
      AssetImageSchemaProperty.colorBlendMode: SchemaHelper.objectSchema(BlendModeSchema.id),
      AssetImageSchemaProperty.errorBuilder: SchemaHelper.stringSchema,
      AssetImageSchemaProperty.excludeFromSemantics: SchemaHelper.boolSchema,
      AssetImageSchemaProperty.filterQuality: SchemaHelper.objectSchema(FilterQualitySchema.id),
      AssetImageSchemaProperty.fit: SchemaHelper.objectSchema(BoxFitSchema.id),
      AssetImageSchemaProperty.frameBuilder: SchemaHelper.stringSchema,
      AssetImageSchemaProperty.gaplessPlatback: SchemaHelper.boolSchema,
      AssetImageSchemaProperty.height: SchemaHelper.numberSchema,
      AssetImageSchemaProperty.isAntiAlias: SchemaHelper.boolSchema,
      AssetImageSchemaProperty.matchTextDirection: SchemaHelper.boolSchema,
      AssetImageSchemaProperty.name: SchemaHelper.stringSchema,
      AssetImageSchemaProperty.opacity: SchemaHelper.numberSchema,
      AssetImageSchemaProperty.package: SchemaHelper.stringSchema,
      AssetImageSchemaProperty.repeat: SchemaHelper.objectSchema(ImageRepeatSchema.id),
      AssetImageSchemaProperty.scale: SchemaHelper.numberSchema,
      AssetImageSchemaProperty.semanticLabel: SchemaHelper.stringSchema,
      AssetImageSchemaProperty.width: SchemaHelper.numberSchema,
    }
  };
}

class AssetImageSchemaProperty {
  static const alignment = 'alignment';
  static const cacheHeight = 'cacheHeight';
  static const cacheWidth = 'cacheWidth';
  static const centerSlice = 'centerSlice';
  static const color = 'color';
  static const colorBlendMode = 'colorBlendMode';
  static const errorBuilder = 'errorBuilder';
  static const excludeFromSemantics = 'excludeFromSemantics';
  static const filterQuality = 'filterQuality';
  static const fit = 'fit';
  static const frameBuilder = 'frameBuilder';
  static const gaplessPlatback = 'gaplessPlatback';
  static const height = 'height';
  static const isAntiAlias = 'isAntiAlias';
  static const matchTextDirection = 'matchTextDirection';
  static const name = 'name';
  static const opacity = 'opacity';
  static const package = 'package';
  static const repeat = 'repeat';
  static const scale = 'scale';
  static const semanticLabel = 'semanticLabel';
  static const width = 'width';
}

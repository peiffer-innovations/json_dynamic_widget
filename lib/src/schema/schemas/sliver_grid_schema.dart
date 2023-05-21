import 'package:json_theme/json_theme_schemas.dart';

class SliverGridSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/sliver_grid.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': -1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/SliverGrid-class.html',
    'title': 'SliverGrid',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      SilverGridSchemaProperty.addAutomaticKeepAlives: SchemaHelper.boolSchema,
      SilverGridSchemaProperty.addRepaintBoundaries: SchemaHelper.boolSchema,
      SilverGridSchemaProperty.addSemanticIndexes: SchemaHelper.boolSchema,
      SilverGridSchemaProperty.findChildIndexCallback: SchemaHelper.stringSchema,
      SilverGridSchemaProperty.gridDelegate: SchemaHelper.anySchema,
      SilverGridSchemaProperty.semanticIndexCallback: SchemaHelper.stringSchema,
      SilverGridSchemaProperty.semanticIndexOffset: SchemaHelper.numberSchema,
    },
  };
}

class SilverGridSchemaProperty {
  static const addAutomaticKeepAlives = 'addAutomaticKeepAlives';
  static const addRepaintBoundaries = 'addRepaintBoundaries';
  static const addSemanticIndexes = 'addSemanticIndexes';
  static const findChildIndexCallback = 'findChildIndexCallback';
  static const gridDelegate = 'gridDelegate';
  static const semanticIndexCallback = 'semanticIndexCallback';
  static const semanticIndexOffset = 'semanticIndexOffset';
}

import 'package:json_theme/json_theme_schemas.dart';

class IntrinsicWidthSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/intrinsic_width';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'IntrinsicWidthBuilder',
    'additionalProperties': false,
    'properties': {
      'stepHeight': SchemaHelper.numberSchema,
      'stepWidth': SchemaHelper.numberSchema,
    }
  };
}

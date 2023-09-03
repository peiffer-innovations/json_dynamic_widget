import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class InputDecorationDecoder {
  static const schemaId =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/input_decoration.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': schemaId,
    r'$children': 1,
    'title': 'InputDecoration',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'alignLabelWithHint': SchemaHelper.stringSchema,
      'border': SchemaHelper.objectSchema(InputBorderSchema.id),
      'contentPadding': SchemaHelper.objectSchema(
        EdgeInsetsGeometrySchema.id,
      ),
      'counter': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'counterStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'counterText': SchemaHelper.stringSchema,
      'disabledBorder': SchemaHelper.objectSchema(InputBorderSchema.id),
      'enabled': SchemaHelper.boolSchema,
      'enabledBorder': SchemaHelper.objectSchema(InputBorderSchema.id),
      'errorBorder': SchemaHelper.objectSchema(InputBorderSchema.id),
      'errorMaxLines': SchemaHelper.numberSchema,
      'errorStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'errorText': SchemaHelper.stringSchema,
      'fillColor': SchemaHelper.objectSchema(ColorSchema.id),
      'filled': SchemaHelper.boolSchema,
      'floatingLabelBehavior': SchemaHelper.objectSchema(
        FloatingLabelBehaviorSchema.id,
      ),
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusedBorder': SchemaHelper.objectSchema(InputBorderSchema.id),
      'focusedErrorBorder': SchemaHelper.objectSchema(InputBorderSchema.id),
      'helperMaxLines': SchemaHelper.numberSchema,
      'helperStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'helperText': SchemaHelper.stringSchema,
      'hintMaxLines': SchemaHelper.numberSchema,
      'hintStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'hintText': SchemaHelper.stringSchema,
      'hoverColor': SchemaHelper.objectSchema(ColorSchema.id),
      'icon': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'isDense': SchemaHelper.boolSchema,
      'labelStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'labelText': SchemaHelper.stringSchema,
      'prefix': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'prefixIcon': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'prefixIconConstraints': SchemaHelper.objectSchema(
        BoxConstraintsSchema.id,
      ),
      'prefixStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'prefixText': SchemaHelper.stringSchema,
      'semanticCounterText': SchemaHelper.stringSchema,
      'suffix': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'suffixIcon': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'suffixIconConstraints': SchemaHelper.objectSchema(
        BoxConstraintsSchema.id,
      ),
      'suffixStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'suffixText': SchemaHelper.stringSchema,
    },
  };

  static InputDecoration? fromDynamic(
    dynamic map, {
    required ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetRegistry? registry,
  }) {
    InputDecoration? result;

    if (map != null) {
      result = InputDecoration(
        alignLabelWithHint: JsonClass.maybeParseBool(map['alignLabelWithHint']),
        border: ThemeDecoder.decodeInputBorder(
          map['border'],
          validate: false,
        ),
        contentPadding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['contentPadding'],
          validate: false,
        ),
        counter: JsonWidgetData.maybeFromDynamic(
          map['counter'],
          registry: registry,
        )?.build(childBuilder: childBuilder, context: context),
        counterStyle: ThemeDecoder.decodeTextStyle(
          map['counterStyle'],
          validate: false,
        ),
        counterText: map['counterText'],
        disabledBorder: ThemeDecoder.decodeInputBorder(
          map['disabledBorder'],
          validate: false,
        ),
        enabled: JsonClass.parseBool(
          map['enabled'],
          whenNull: true,
        ),
        enabledBorder: ThemeDecoder.decodeInputBorder(
          map['enabledBorder'],
          validate: false,
        ),
        errorBorder: ThemeDecoder.decodeInputBorder(
          map['errorBorder'],
          validate: false,
        ),
        errorMaxLines: JsonClass.maybeParseInt(map['errorMaxLines']),
        errorStyle: ThemeDecoder.decodeTextStyle(
          map['errorStyle'],
          validate: false,
        ),
        errorText: map['errorText'],
        fillColor: ThemeDecoder.decodeColor(
          map['fillColor'],
          validate: false,
        ),
        filled: JsonClass.maybeParseBool(map['filled']),
        floatingLabelBehavior: ThemeDecoder.decodeFloatingLabelBehavior(
          map['floatingLabelBehavior'],
          validate: false,
        ),
        focusColor: ThemeDecoder.decodeColor(
          map['focusColor'],
          validate: false,
        ),
        focusedBorder: ThemeDecoder.decodeInputBorder(
          map['focusedBorder'],
          validate: false,
        ),
        focusedErrorBorder: ThemeDecoder.decodeInputBorder(
          map['focusedErrorBorder'],
          validate: false,
        ),
        helperMaxLines: JsonClass.maybeParseInt(map['helperMaxLines']),
        helperStyle: ThemeDecoder.decodeTextStyle(
          map['helperStyle'],
          validate: false,
        ),
        helperText: map['helperText'],
        hintMaxLines: JsonClass.maybeParseInt(map['hintMaxLines']),
        hintStyle: ThemeDecoder.decodeTextStyle(
          map['hintStyle'],
          validate: false,
        ),
        hintText: map['hintText'],
        hoverColor: ThemeDecoder.decodeColor(
          map['hoverColor'],
          validate: false,
        ),
        icon: JsonWidgetData.maybeFromDynamic(
          map['icon'],
          registry: registry,
        )?.build(
          childBuilder: childBuilder,
          context: context,
        ),
        isDense: JsonClass.maybeParseBool(map['isDense']),
        labelStyle: ThemeDecoder.decodeTextStyle(
          map['labelStyle'],
          validate: false,
        ),
        labelText: map['labelText'],
        prefix: JsonWidgetData.maybeFromDynamic(
          map['prefix'],
          registry: registry,
        )?.build(
          childBuilder: childBuilder,
          context: context,
        ),
        prefixIcon: JsonWidgetData.maybeFromDynamic(
          map['prefixIcon'],
          registry: registry,
        )?.build(
          childBuilder: childBuilder,
          context: context,
        ),
        prefixIconConstraints: ThemeDecoder.decodeBoxConstraints(
          map['prefixIconConstraints'],
          validate: false,
        ),
        prefixStyle: ThemeDecoder.decodeTextStyle(
          map['prefixStyle'],
          validate: false,
        ),
        prefixText: map['prefixText'],
        semanticCounterText: map['semanticCounterText'],
        suffix: JsonWidgetData.maybeFromDynamic(
          map['suffix'],
          registry: registry,
        )?.build(
          childBuilder: childBuilder,
          context: context,
        ),
        suffixIcon: JsonWidgetData.maybeFromDynamic(
          map['suffixIcon'],
          registry: registry,
        )?.build(
          childBuilder: childBuilder,
          context: context,
        ),
        suffixIconConstraints: ThemeDecoder.decodeBoxConstraints(
          map['suffixIconConstraints'],
          validate: false,
        ),
        suffixStyle: ThemeDecoder.decodeTextStyle(
          map['suffixStyle'],
          validate: false,
        ),
        suffixText: map['suffixText'],
      );
    }

    return result;
  }
}

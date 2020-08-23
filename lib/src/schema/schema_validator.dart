import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_schema/json_schema.dart';
import 'package:json_theme/json_theme_schemas.dart';
import 'package:meta/meta.dart';

import 'all.dart';

/// Schema validator that can validate the JSON Theme objects while also being
/// able to be extended to also perform validation against schemas that include
/// JSON Theme objects.
class SchemaValidator {
  factory SchemaValidator() => _instance;
  SchemaValidator._internal() {
    assert(() {
      var cache = SchemaCache();

      cache.addSchema(AlignSchema.id, AlignSchema.schema);
      cache.addSchema(AnimatedOpacitySchema.id, AnimatedOpacitySchema.schema);
      cache.addSchema(AppBarSchema.id, AppBarSchema.schema);
      cache.addSchema(AspectRatioSchema.id, AspectRatioSchema.schema);
      cache.addSchema(AssetImageSchema.id, AssetImageSchema.schema);
      cache.addSchema(BaselineSchema.id, BaselineSchema.schema);
      cache.addSchema(ButtonBarSchema.id, ButtonBarSchema.schema);
      cache.addSchema(CardSchema.id, CardSchema.schema);
      cache.addSchema(CenterSchema.id, CenterSchema.schema);
      cache.addSchema(CheckboxSchema.id, CheckboxSchema.schema);
      cache.addSchema(
        CircularProgressIndicatorSchema.id,
        CircularProgressIndicatorSchema.schema,
      );
      cache.addSchema(ClipOvalSchema.id, ClipOvalSchema.schema);
      cache.addSchema(ClipRectSchema.id, ClipRectSchema.schema);
      cache.addSchema(ClipRRectSchema.id, ClipRRectSchema.schema);
      cache.addSchema(ColumnSchema.id, ColumnSchema.schema);
      cache.addSchema(ConditionalSchema.id, ConditionalSchema.schema);
      cache.addSchema(ContainerSchema.id, ContainerSchema.schema);
      cache.addSchema(CupertinoSwitchSchema.id, CupertinoSwitchSchema.schema);
      cache.addSchema(DecoratedBoxSchema.id, DecoratedBoxSchema.schema);
      cache.addSchema(
        DropdownButtonFormFieldSchema.id,
        DropdownButtonFormFieldSchema.schema,
      );
      cache.addSchema(ExpandedSchema.id, ExpandedSchema.schema);
      cache.addSchema(FittedBoxSchema.id, FittedBoxSchema.schema);
      cache.addSchema(FlatButtonSchema.id, FlatButtonSchema.schema);
      cache.addSchema(FlexibleSchema.id, FlexibleSchema.schema);
      cache.addSchema(FormSchema.id, FormSchema.schema);
      cache.addSchema(GestureDetectorSchema.id, GestureDetectorSchema.schema);
      cache.addSchema(HeroSchema.id, HeroSchema.schema);
      cache.addSchema(IconSchema.id, IconSchema.schema);
      cache.addSchema(IgnorePointerSchema.id, IgnorePointerSchema.schema);
      cache.addSchema(IndexedStackSchema.id, IndexedStackSchema.schema);
      cache.addSchema(InkWellSchema.id, InkWellSchema.schema);
      cache.addSchema(InputErrorSchema.id, InputErrorSchema.schema);
      cache.addSchema(JsonWidgetDataSchema.id, JsonWidgetDataSchema.schema);
      cache.addSchema(
        LinearProgressIndicatorSchema.id,
        LinearProgressIndicatorSchema.schema,
      );
      cache.addSchema(ListTileSchema.id, ListTileSchema.schema);
      cache.addSchema(ListViewSchema.id, ListViewSchema.schema);
      cache.addSchema(MaterialSchema.id, MaterialSchema.schema);
      cache.addSchema(MemoryImageSchema.id, MemoryImageSchema.schema);
      cache.addSchema(NetworkImageSchema.id, NetworkImageSchema.schema);
      cache.addSchema(OpacitySchema.id, OpacitySchema.schema);
      cache.addSchema(PaddingSchema.id, PaddingSchema.schema);
      cache.addSchema(PositionedSchema.id, PositionedSchema.schema);
      cache.addSchema(RadioSchema.id, RadioSchema.schema);
      cache.addSchema(RaisedButtonSchema.id, RaisedButtonSchema.schema);
      cache.addSchema(RowSchema.id, RowSchema.schema);
      cache.addSchema(SafeAreaSchema.id, SafeAreaSchema.schema);
      cache.addSchema(SaveContextSchema.id, SaveContextSchema.schema);
      cache.addSchema(ScaffoldSchema.id, ScaffoldSchema.schema);
      cache.addSchema(SetValueSchema.id, SetValueSchema.schema);
      cache.addSchema(SetWidgetSchema.id, SetWidgetSchema.schema);
      cache.addSchema(
        SingleChildScrollViewSchema.id,
        SingleChildScrollViewSchema.schema,
      );
      cache.addSchema(SizedBoxSchema.id, SizedBoxSchema.schema);
      cache.addSchema(StackSchema.id, StackSchema.schema);
      cache.addSchema(SwitchSchema.id, SwitchSchema.schema);
      cache.addSchema(TextFormFieldSchema.id, TextFormFieldSchema.schema);
      cache.addSchema(TextSchema.id, TextSchema.schema);
      cache.addSchema(ThemeSchema.id, ThemeSchema.schema);

      return true;
    }());
  }
  static final SchemaValidator _instance = SchemaValidator._internal();

  /// Allows the global disabling of validation in DEBUG builds.  This value is
  /// ignored in RELEASE builds as validation is never enabled in RELEASE
  /// builds.  This is provided because there may be times with DEBUG builds
  /// where the performance overhead of the validation is too costly.
  bool enabled = true;

  /// Validates the given [schemaId] against the given [value].  If the
  /// optional [validate] parameter is not [true] then this will no-op and
  /// immediately return with [true].
  ///
  /// It should be noted that this validation is a relatively expensive
  /// operation.  For that reason, this defaults to performing the validation
  /// when in the debug build and skipping validation for release builds.  This
  /// optimization can be overridden by setting [debugOnly] to [false].
  bool validate({
    bool debugOnly = true,
    @required String schemaId,
    @required dynamic value,
    bool validate = true,
  }) {
    var result = true;
    if (validate == true && enabled == true) {
      if (debugOnly == true) {
        assert(() {
          result = _validate(
            schemaId: schemaId,
            value: value,
          );

          return true;
        }());
      } else {
        result = _validate(
          schemaId: schemaId,
          value: value,
        );
      }
    }

    return result;
  }

  bool _validate({
    @required String schemaId,
    @required dynamic value,
  }) {
    var result = true;
    RefProvider refProvider;
    refProvider = (String ref) {
      var schema = SchemaCache().getSchema(ref);
      if (schema == null) {
        throw Exception('Unable to find schema: $ref');
      }

      return JsonSchema.createSchema(
        schema,
        refProvider: refProvider,
      );
    };

    var schemaData = SchemaCache().getSchema(schemaId);
    assert(schemaData != null, 'Cannot find schema: $schemaId');
    var jsonSchema = JsonSchema.createSchema(
      schemaData,
      refProvider: refProvider,
    );

    var processedValue = value is Map
        ? JsonClass.removeNull(Map<String, dynamic>.from(value))
        : value;

    var errors = jsonSchema.validateWithErrors(processedValue);
    if (errors?.isNotEmpty == true) {
      result = false;
      var errorStr =
          'Value: ${json.encode(value)}\n\nSchema Error: $schemaId\n';
      for (var error in errors) {
        errorStr += ' * [${error.schemaPath}]: ${error.message}\n';
      }

      FlutterError.reportError(
        FlutterErrorDetails(
          exception: Exception(errorStr),
        ),
      );
    }

    return result;
  }
}

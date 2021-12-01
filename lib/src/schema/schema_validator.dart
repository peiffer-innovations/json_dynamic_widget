import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_schema2/json_schema2.dart';
import 'package:json_theme/json_theme_schemas.dart';

import 'json_dynamic_widget_schemas.dart';

/// Schema validator that can validate the JSON Theme objects while also being
/// able to be extended to also perform validation against schemas that include
/// JSON Theme objects.
class SchemaValidator {
  factory SchemaValidator() => _instance;
  SchemaValidator._internal() {
    assert(() {
      var cache = SchemaCache();

      JsonDynamicWidgetSchemas.all.forEach(
        (id, schema) => cache.addSchema(id, schema),
      );

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
    required String? schemaId,
    required dynamic value,
    bool validate = true,
  }) {
    var result = true;
    if (validate == true && enabled == true) {
      if (debugOnly == true) {
        assert(() {
          result = _validate(
            schemaId: schemaId!,
            value: value,
          );

          return true;
        }());
      } else {
        result = _validate(
          schemaId: schemaId!,
          value: value,
        );
      }
    }

    return result;
  }

  bool _validate({
    required String schemaId,
    required dynamic value,
  }) {
    var result = true;
    RefProvider? refProvider;
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
    if (errors.isNotEmpty == true) {
      var encoder = JsonEncoder.withIndent('  ');
      result = false;
      var errorStr =
          '*** VALIDATION ERROR ***:\n${encoder.convert(value)}\n\nSchema Error: $schemaId\n';
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

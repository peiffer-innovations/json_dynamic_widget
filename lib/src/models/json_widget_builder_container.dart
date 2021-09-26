import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme_schemas.dart';

/// Container for a [JsonWidgetBuilder] builder as well as an associated schema
/// id.  The schema id will be used to validate the JSON args against the
/// schema if it is not `null`.  If it is `null`, no schema validation will be
/// performed against the JSON for this particular builder.
class JsonWidgetBuilderContainer {
  const JsonWidgetBuilderContainer({
    required this.builder,
    this.schemaId,
  });

  /// The builder that will create the [JsonWidgetBuilder] from JSON.
  final JsonWidgetBuilderBuilder builder;

  /// Optional [schemaId].  Either the schema must be registered against the
  /// [SchemaCache] or an error will happen when the validation is attempted.
  ///
  /// This can technically be any string, but it is customary to use a URI for
  /// improved tooling support.
  final String? schemaId;
}

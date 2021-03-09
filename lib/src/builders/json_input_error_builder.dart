import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [InputError] widget.  See the [fromDynamic] for
/// the format.
class JsonInputErrorBuilder extends JsonWidgetBuilder {
  JsonInputErrorBuilder({
    this.text,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'input_error';

  final String? text;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "text": <String>
  /// }
  /// ```
  static JsonInputErrorBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonInputErrorBuilder? result;

    if (map != null) {
      result = JsonInputErrorBuilder(
        text: map['text'],
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) =>
      InputError(
        error: text,
        key: key,
      );
}

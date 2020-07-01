import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [IgnorePointer] widget.  See the [fromDynamic] for
/// the format.
class JsonIgnorePointerBuilder extends JsonWidgetBuilder {
  JsonIgnorePointerBuilder({
    this.ignoring,
    this.ignoringSemantics,
  });

  static const type = 'ignore_pointer';

  final bool ignoring;
  final bool ignoringSemantics;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "ignoring": <bool>,
  ///   "ignoringSemantics": <bool>
  /// }
  /// ```
  static JsonIgnorePointerBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonIgnorePointerBuilder result;

    if (map != null) {
      result = JsonIgnorePointerBuilder(
        ignoring: map['ignoring'] == null
            ? true
            : JsonClass.parseBool(map['ignoring']),
        ignoringSemantics: map['ignoringSemantics'] == null
            ? null
            : JsonClass.parseBool(map['ignoringSemantics']),
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.length == 1,
      '[JsonIgnorePointerBuilder] only supports exactly one child.',
    );

    return IgnorePointer(
      ignoring: ignoring,
      ignoringSemantics: ignoringSemantics,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

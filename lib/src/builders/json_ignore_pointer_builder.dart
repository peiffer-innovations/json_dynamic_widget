import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [IgnorePointer] widget.  See the [fromDynamic] for
/// the format.
class JsonIgnorePointerBuilder extends JsonWidgetBuilder {
  JsonIgnorePointerBuilder({
    required this.ignoring,
    this.ignoringSemantics,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'ignore_pointer';

  final bool ignoring;
  final bool? ignoringSemantics;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "ignoring": <bool>,
  ///   "ignoringSemantics": <bool>
  /// }
  /// ```
  static JsonIgnorePointerBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonIgnorePointerBuilder? result;

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
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    var child = getChild(data);

    return IgnorePointer(
      ignoring: ignoring,
      ignoringSemantics: ignoringSemantics,
      key: key,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

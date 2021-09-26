import 'package:automated_testing_framework/widgets.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [SizedBox] widget.  See the [fromDynamic] for the
/// format.
class JsonTestableBuilder extends JsonWidgetBuilder {
  JsonTestableBuilder({
    this.onRequestError,
    this.onRequestValue,
    this.onSetValue,
    this.scrollableId,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'testable';

  final String? Function()? onRequestError;
  final dynamic Function()? onRequestValue;
  final ValueChanged<dynamic>? onSetValue;
  final String? scrollableId;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "onRequestError": <String? Function()>,
  ///   "onRequestValue": <dynamic Function()>,
  ///   "onSetValue": <ValueChanged<dynmaic>>,
  ///   "scrollableId": <String>
  /// }
  /// ```
  static JsonTestableBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonTestableBuilder? result;
    if (map != null) {
      result = JsonTestableBuilder(
        onRequestError: map['onRequestError'],
        onRequestValue: map['onRequestValue'],
        onSetValue: map['onSetValue'],
        scrollableId: map['scrollableId']?.toString(),
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

    return Testable(
      id: data.id,
      onRequestError: onRequestError,
      onRequestValue: onRequestValue,
      onSetValue: onSetValue,
      scrollableId: scrollableId,
      child: data.children?.length != 1
          ? SizedBox()
          : child.build(
              childBuilder: childBuilder,
              context: context,
            ),
    );
  }
}

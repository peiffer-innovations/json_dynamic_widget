import 'package:child_builder/child_builder.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [ClipOval] widget.  See the [fromDynamic] for the
/// format.
class JsonClipOvalBuilder extends JsonWidgetBuilder {
  JsonClipOvalBuilder({
    this.clipBehavior,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;

  static const type = 'clip_oval';

  final Clip clipBehavior;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "clipBehavior": <Clip>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeClip]
  static JsonClipOvalBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonClipOvalBuilder result;

    if (map != null) {
      result = JsonClipOvalBuilder(
        clipBehavior: ThemeDecoder.decodeClip(
              map['clipBehavior'],
              validate: false,
            ) ??
            Clip.hardEdge,
      );
    }

    return result;
  }

  @override
  Widget buildCustom(
      {ChildWidgetBuilder childBuilder,
      @required BuildContext context,
      @required JsonWidgetData data,
      Key key}) {
    var child = getChild(data);

    return ClipOval(
      clipBehavior: clipBehavior,
      key: key,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Flexible] widget.  See the [fromDynamic] for the
/// format.
class JsonFlexibleBuilder extends JsonWidgetBuilder {
  JsonFlexibleBuilder({
    this.fit,
    this.flex,
  });

  static const type = 'flexible';

  final FlexFit fit;
  final int flex;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "fit": <FlexFit>,
  ///   "flex": <int>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeFlexFit]
  static JsonFlexibleBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonFlexibleBuilder result;

    if (map != null) {
      result = JsonFlexibleBuilder(
        fit: ThemeDecoder.decodeFlexFit(
              map['fit'],
              validate: false,
            ) ??
            FlexFit.loose,
        flex: JsonClass.parseInt(map['flex'], 1),
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
      '[JsonFlexibleBuilder] only supports exactly one child.',
    );

    return Flexible(
      fit: fit,
      flex: flex,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

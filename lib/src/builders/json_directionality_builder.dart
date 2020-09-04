import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build a [Directionality] widget.  See the [fromDynamic] for the
/// format.
class JsonDirectionalityBuilder extends JsonWidgetBuilder {
  JsonDirectionalityBuilder({
    @required this.textDirection,
  }) : assert(textDirection != null);

  static const type = 'directionality';

  final TextDirection textDirection;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "textDirection<TextDirection>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeTextDirection]
  static JsonDirectionalityBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonDirectionalityBuilder result;

    if (map != null) {
      result = JsonDirectionalityBuilder(
        textDirection: ThemeDecoder.decodeTextDirection(
          map['textDirection'],
          validate: false,
        ),
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
      '[JsonDirectionalityBuilder] only supports exactly one child.',
    );

    return Directionality(
      textDirection: textDirection,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

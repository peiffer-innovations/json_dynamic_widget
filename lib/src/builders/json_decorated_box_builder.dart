import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [DecoratedBox] widget.  See the [fromDynamic] for the
/// format.
class JsonDecoratedBoxBuilder extends JsonWidgetBuilder {
  JsonDecoratedBoxBuilder({
    @required this.decoration,
    this.position,
  }) : assert(decoration != null);

  static const type = 'decorated_box';

  final BoxDecoration decoration;
  final DecorationPosition position;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "decoration": <BoxDecoration>,
  ///   "position": <DecorationPosition>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeBoxDecoration]
  ///  * [ThemeDecoder.decodeDecorationPosition]
  static JsonDecoratedBoxBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonDecoratedBoxBuilder result;

    if (map != null) {
      result = JsonDecoratedBoxBuilder(
        decoration: ThemeDecoder.decodeBoxDecoration(
          map['decoration'],
          validate: false,
        ),
        position: ThemeDecoder.decodeDecorationPosition(
              map['position'],
              validate: false,
            ) ??
            DecorationPosition.background,
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    childBuilder,
    BuildContext context,
    JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.length == 1,
      '[JsonDecoratedBoxBuilder] only supports exactly one child.',
    );

    return DecoratedBox(
      decoration: decoration,
      position: position,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Theme] widget.  See the [fromDynamic] for the
/// format.
class JsonThemeBuilder extends JsonWidgetBuilder {
  JsonThemeBuilder({
    required this.theme,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'theme';

  final ThemeData theme;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "data": <ThemeData>,
  ///   "isMaterialAppTheme": <bool>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeThemeData]
  static JsonThemeBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonThemeBuilder? result;
    if (map != null) {
      result = JsonThemeBuilder(
        theme: ThemeDecoder.decodeThemeData(
              map['data'],
              validate: false,
            ) ??
            ThemeData(),
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

    return Theme(
      data: theme,
      child: Builder(
        key: key,
        builder: (BuildContext context) => child.build(
          childBuilder: childBuilder,
          context: context,
        ),
      ),
    );
  }
}

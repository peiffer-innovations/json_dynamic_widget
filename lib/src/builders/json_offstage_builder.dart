import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [Offstage] widget.  See the [fromDynamic] for the
/// format.
class JsonOffstageBuilder extends JsonWidgetBuilder {
  JsonOffstageBuilder({
    this.offstage,
  });

  static const type = 'offstage';

  final bool offstage;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "offstage": <bool>
  /// }
  /// ```
  static JsonOffstageBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonOffstageBuilder result;

    if (map != null) {
      result = JsonOffstageBuilder(
        offstage: map['offstage'] == null
            ? true
            : JsonClass.parseBool(
                map['offstage'],
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
      '[JsonOffstageBuilder] only supports exactly one child.',
    );

    return Offstage(
      offstage: offstage,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

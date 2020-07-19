import 'package:child_builder/child_builder.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

class DottedBorderBuilder extends JsonWidgetBuilder {
  DottedBorderBuilder({
    this.color,
    @required this.dashPattern,
  }) : assert(dashPattern != null);

  static const type = 'dotted_border';

  final Color color;
  final List<double> dashPattern;

  static DottedBorderBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    DottedBorderBuilder result;

    if (map != null) {
      result = DottedBorderBuilder(
        color: ThemeDecoder.decodeColor(
          map['color'],
          validate: false,
        ),
        dashPattern: map['dashPattern'] == null
            ? null
            : List<double>.from(
                map['dashPattern'].map(
                  (e) => JsonClass.parseDouble(e, 0.0),
                ),
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
      '[DottedBorderBuilder] only supports exactly one child.',
    );

    return DottedBorder(
      borderType: BorderType.Circle,
      color: color,
      dashPattern: dashPattern,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

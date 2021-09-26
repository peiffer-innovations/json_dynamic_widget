import 'package:child_builder/child_builder.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

class DottedBorderBuilder extends JsonWidgetBuilder {
  DottedBorderBuilder({
    this.color,
    required this.dashPattern,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'dotted_border';

  final Color? color;
  final List<double> dashPattern;

  static DottedBorderBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    if (map == null) {
      throw Exception('DottedBorderBuilder: map is null');
    }
    return DottedBorderBuilder(
      color: ThemeDecoder.decodeColor(
            map['color'],
            validate: false,
          ) ??
          Colors.black,
      dashPattern: map['dashPattern'] == null
          ? [0.0]
          : List<double>.from(
              map['dashPattern'].map(
                (e) => JsonClass.parseDouble(e, 0.0),
              ),
            ),
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    var child = getChild(data);

    return DottedBorder(
      borderType: BorderType.Circle,
      color: color ?? Colors.black,
      dashPattern: dashPattern,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

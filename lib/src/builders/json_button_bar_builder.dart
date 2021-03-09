import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [ButtonBar] widget.  See the [fromDynamic] for the
/// format.
class JsonButtonBarBuilder extends JsonWidgetBuilder {
  JsonButtonBarBuilder({
    this.alignment,
    this.buttonAlignedDropdown,
    this.buttonHeight,
    this.buttonMinWidth,
    this.buttonPadding,
    this.buttonTextTheme,
    this.layoutBehavior,
    this.mainAxisSize,
    this.overflowButtonSpacing,
    this.overflowDirection,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = -1;

  static const type = 'button_bar';

  final MainAxisAlignment? alignment;
  final bool? buttonAlignedDropdown;
  final double? buttonHeight;
  final double? buttonMinWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final ButtonTextTheme? buttonTextTheme;
  final ButtonBarLayoutBehavior? layoutBehavior;
  final MainAxisSize? mainAxisSize;
  final double? overflowButtonSpacing;
  final VerticalDirection? overflowDirection;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   alignment: <MainAxisAlignment>,
  ///   buttonAlignedDropdown: <bool>,
  ///   buttonHeight: <double>,
  ///   buttonMinWidth: <double>,
  ///   buttonPadding: <EdgeInsetsGeometry>,
  ///   buttonTextTheme: <ButtonTextTheme>,
  ///   layoutBehavior: <ButtonBarLayoutBehavior>,
  ///   mainAxisSize: <MainAxisSize>,
  ///   overflowButtonSpacing: <double>,
  ///   overflowDirection: <VerticalDirection>,
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeTextBaseline]
  static JsonButtonBarBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonButtonBarBuilder? result;

    if (map != null) {
      result = JsonButtonBarBuilder(
        alignment: ThemeDecoder.decodeMainAxisAlignment(map['alignment']),
        buttonAlignedDropdown: map['buttonAlignedDropdown'] == null
            ? null
            : JsonClass.parseBool(map['buttonAlignedDropdown']),
        buttonHeight: JsonClass.parseDouble(map['buttonHeight']),
        buttonMinWidth: JsonClass.parseDouble(map['buttonMinWidth']),
        buttonPadding:
            ThemeDecoder.decodeEdgeInsetsGeometry(map['buttonPadding']),
        buttonTextTheme:
            ThemeDecoder.decodeButtonTextTheme(map['buttonTextTheme']),
        layoutBehavior:
            ThemeDecoder.decodeButtonBarLayoutBehavior(map['layoutBehavior']),
        mainAxisSize: ThemeDecoder.decodeMainAxisSize(map['mainAxisSize']),
        overflowButtonSpacing:
            JsonClass.parseDouble(map['overflowButtonSpacing']),
        overflowDirection:
            ThemeDecoder.decodeVerticalDirection(map['overflowDirection']),
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
    return ButtonBar(
      alignment: alignment,
      buttonAlignedDropdown: buttonAlignedDropdown,
      buttonHeight: buttonHeight,
      buttonMinWidth: buttonMinWidth,
      buttonPadding: buttonPadding,
      buttonTextTheme: buttonTextTheme,
      key: key,
      layoutBehavior: layoutBehavior,
      mainAxisSize: mainAxisSize,
      overflowButtonSpacing: overflowButtonSpacing,
      overflowDirection: overflowDirection,
      children: [
        for (var child in data.children ?? <JsonWidgetData>[])
          child.build(
            context: context,
            childBuilder: childBuilder,
          ),
      ],
    );
  }
}

import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Tooltip] widget.  See the [fromDynamic] for the
/// format.
class JsonTooltipBuilder extends JsonWidgetBuilder {
  JsonTooltipBuilder({
    this.decoration,
    this.enableFeedback,
    this.excludeFromSemantics,
    this.height,
    this.margin,
    required this.message,
    this.onTriggered,
    this.padding,
    this.preferBelow,
    this.richMessage,
    this.showDuration,
    this.textAlign,
    this.textStyle,
    this.triggerMode,
    this.verticalOffset,
    this.waitDuration,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'tooltip';

  final Decoration? decoration;
  final bool? enableFeedback;
  final bool? excludeFromSemantics;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final String message;
  final TooltipTriggeredCallback? onTriggered;
  final EdgeInsetsGeometry? padding;
  final bool? preferBelow;
  final InlineSpan? richMessage;
  final Duration? showDuration;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TooltipTriggerMode? triggerMode;
  final double? verticalOffset;
  final Duration? waitDuration;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "decoration": "<BoxDecoration>",
  ///   "enableFeedback": "<bool>",
  ///   "excludeFromSemantics": "<bool>",
  ///   "height": "<double>",
  ///   "margin": "<EdgeInsetsGeometry>",
  ///   "message": "<String>",
  ///   "onTriggered": "<TooltipTriggeredCallback>",
  ///   "padding": "<EdgeInsetsGeometry>",
  ///   "preferBelow": "<bool>",
  ///   "richMessage": "<InlineSpan>",
  ///   "showDuration": "<Duration>",
  ///   "textAlign": "<TextAlign>",
  ///   "textStyle": "<TextStyle>",
  ///   "triggerMode": "<bool>",
  ///   "verticalOffset": "<double>",
  ///   "waitDuration": "<Duration>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [JsonClass.parseDurationFromMillis]
  ///  * [ThemeDecoder.decodeBoxDecoration]
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  ///  * [ThemeDecoder.decodeTextAlign]
  ///  * [ThemeDecoder.decodeTextStyle]
  ///  * [ThemeDecoder.decodeTooltipTriggerMode]
  static JsonTooltipBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonTooltipBuilder? result;
    if (map != null) {
      result = JsonTooltipBuilder(
        decoration: ThemeDecoder.decodeBoxDecoration(
          map['decoration'],
          validate: false,
        ),
        enableFeedback: map['enableFeedback'] == null
            ? null
            : JsonClass.parseBool(map['enableFeedback']),
        excludeFromSemantics: map['excludeFromSemantics'] == null
            ? null
            : JsonClass.parseBool(map['excludeFromSemantics']),
        height: JsonClass.parseDouble(map['height']),
        margin: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['margin'],
          validate: false,
        ),
        message: map['message']?.toString() ?? '',
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['padding'],
          validate: false,
        ),
        preferBelow: map['preferBelow'] == null
            ? null
            : JsonClass.parseBool(map['preferBelow']),
        richMessage: map['richMessage'],
        showDuration: JsonClass.parseDurationFromMillis(map['showDuration']),
        textAlign: ThemeDecoder.decodeTextAlign(
          map['textAlign'],
          validate: false,
        ),
        textStyle: ThemeDecoder.decodeTextStyle(
          map['textStyle'],
          validate: false,
        ),
        triggerMode: ThemeDecoder.decodeTooltipTriggerMode(
          map['triggerMode'],
          validate: false,
        ),
        verticalOffset: JsonClass.parseDouble(map['verticalOffset']),
        waitDuration: JsonClass.parseDurationFromMillis(map['waitDuration']),
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
  }) =>
      Tooltip(
        decoration: decoration,
        enableFeedback: enableFeedback,
        excludeFromSemantics: excludeFromSemantics,
        height: height,
        key: key,
        margin: margin,
        message: message,
        onTriggered: onTriggered,
        padding: padding,
        preferBelow: preferBelow,
        richMessage: richMessage,
        showDuration: showDuration,
        textAlign: textAlign,
        textStyle: textStyle,
        triggerMode: triggerMode,
        verticalOffset: verticalOffset,
        waitDuration: waitDuration,
        child: getChild(data).build(
          childBuilder: childBuilder,
          context: context,
        ),
      );
}

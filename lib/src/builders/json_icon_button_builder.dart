import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [IconButton] widget.  See the [fromDynamic] for
/// the format.
class JsonIconButtonBuilder extends JsonWidgetBuilder {
  JsonIconButtonBuilder({
    required this.alignment,
    required this.autofocus,
    this.color,
    this.constraints,
    this.disabledColor,
    required this.enableFeedback,
    this.focusColor,
    this.focusNode,
    this.highlightColor,
    this.hoverColor,
    this.icon,
    required this.iconSize,
    required this.mouseCursor,
    this.onPressed,
    required this.padding,
    this.splashColor,
    this.splashRadius,
    this.tooltip,
    this.visualDensity,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'icon_button';

  final Alignment alignment;
  final bool autofocus;
  final Color? color;
  final BoxConstraints? constraints;
  final Color? disabledColor;
  final bool enableFeedback;
  final Color? focusColor;
  final FocusNode? focusNode;
  final Color? highlightColor;
  final Color? hoverColor;
  final JsonWidgetData? icon;
  final double iconSize;
  final MouseCursor mouseCursor;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final Color? splashColor;
  final double? splashRadius;
  final String? tooltip;
  final VisualDensity? visualDensity;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": <Alignment>,
  ///   "autofocus": <bool>,
  ///   "color": <Color>,
  ///   "constraints": <BoxConstraints>,
  ///   "disabledColor": <Color>,
  ///   "enableFeedback": <bool>,
  ///   "focusColor": <Color>,
  ///   "focusNode": <FocusNode>,
  ///   "highlightColor": <Color>,
  ///   "hoverColor": <Color>,
  ///   "icon": <JsonWidgetData>,
  ///   "iconSize": <double>,
  ///   "mouseCursor": <MouseCursor>,
  ///   "onPressed": <VoidCallback>,
  ///   "padding": <EdgeInsetsGeometry>,
  ///   "splashColor": <Color>,
  ///   "splashRadius": <double>,
  ///   "tooltip": <String>,
  ///   "visualDensity": <VisualDensity>,
  /// }
  /// ```
  ///
  /// This can accept a "child" in place of the "icon".  This considers both of
  /// those as synonyms and if both are set, the "icon" will take preference.
  ///
  /// As a note, the [FocusNode], and [VoidCallback] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeAlignment]
  ///  * [ThemeDecoder.decodeBoxConstraints]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  ///  * [ThemeDecoder.decodeMouseCursor]
  ///  * [ThemeDecoder.decodeVisualDensity]
  static JsonIconButtonBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonIconButtonBuilder? result;

    if (map != null) {
      result = JsonIconButtonBuilder(
        alignment:
            ThemeDecoder.decodeAlignment(map['alignment']) ?? Alignment.center,
        autofocus: JsonClass.parseBool(map['autofocus']),
        color: ThemeDecoder.decodeColor(map['color']),
        constraints: ThemeDecoder.decodeBoxConstraints(map['constraints']),
        disabledColor: ThemeDecoder.decodeColor(map['disabledColor']),
        enableFeedback: map['enableFeedback'] == null
            ? true
            : JsonClass.parseBool(map['enableFeedback']),
        focusColor: ThemeDecoder.decodeColor(map['focusColor']),
        focusNode: map['focusColor'],
        highlightColor: ThemeDecoder.decodeColor(map['highlightColor']),
        hoverColor: ThemeDecoder.decodeColor(map['hoverColor']),
        icon: JsonWidgetData.fromDynamic(map['icon']),
        iconSize: JsonClass.parseDouble(map['iconSize'], 24.0)!,
        mouseCursor: ThemeDecoder.decodeMouseCursor(map['mouseCursor']) ??
            SystemMouseCursors.click,
        onPressed: map['onPressed'],
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(map['padding']) ??
            const EdgeInsets.all(8.0),
        splashColor: ThemeDecoder.decodeColor(map['splashColor']),
        splashRadius: JsonClass.parseDouble(map['splashRadius']),
        tooltip: map['tooltip']?.toString(),
        visualDensity: ThemeDecoder.decodeVisualDensity(map['visualDensity']),
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
    var theIcon = icon ?? getChild(data);

    return IconButton(
      alignment: alignment,
      autofocus: autofocus,
      color: color,
      constraints: constraints,
      disabledColor: disabledColor,
      enableFeedback: enableFeedback,
      focusColor: focusColor,
      focusNode: focusNode,
      highlightColor: highlightColor,
      hoverColor: hoverColor,
      icon: theIcon.build(childBuilder: childBuilder, context: context),
      iconSize: iconSize,
      key: key,
      mouseCursor: mouseCursor,
      onPressed: onPressed,
      padding: padding,
      splashColor: splashColor,
      splashRadius: splashRadius,
      tooltip: tooltip,
      visualDensity: visualDensity,
    );
  }
}

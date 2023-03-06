import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [IconButton] widget.  See the [fromDynamic] for
/// the format.
class JsonIconButtonBuilder extends JsonWidgetBuilder {
  const JsonIconButtonBuilder({
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
    this.isSelected,
    required this.mouseCursor,
    this.onPressed,
    required this.padding,
    this.selectedIcon,
    this.splashColor,
    this.splashRadius,
    this.style,
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
  final bool? isSelected;
  final double iconSize;
  final MouseCursor mouseCursor;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final JsonWidgetData? selectedIcon;
  final Color? splashColor;
  final double? splashRadius;
  final ButtonStyle? style;
  final String? tooltip;
  final VisualDensity? visualDensity;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": "<Alignment>",
  ///   "autofocus": "<bool>",
  ///   "color": "<Color>",
  ///   "constraints": "<BoxConstraints>",
  ///   "disabledColor": "<Color>",
  ///   "enableFeedback": "<bool>",
  ///   "focusColor": "<Color>",
  ///   "focusNode": "<FocusNode>",
  ///   "highlightColor": "<Color>",
  ///   "hoverColor": "<Color>",
  ///   "icon": "<JsonWidgetData>",
  ///   "iconSize": "<double>",
  ///   "isSelected": "<bool>",
  ///   "mouseCursor": "<MouseCursor>",
  ///   "onPressed": "<VoidCallback>",
  ///   "padding": "<EdgeInsetsGeometry>",
  ///   "selectedIcon": "<JsonWidgetData>",
  ///   "splashColor": "<Color>",
  ///   "splashRadius": "<double>",
  ///   "style": "<ButtonStyle>",
  ///   "tooltip": "<String>",
  ///   "visualDensity": "<VisualDensity>"
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
  ///  * [ThemeDecoder.decodeButtonStyle]
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
        alignment: ThemeDecoder.decodeAlignment(
              map['alignment'],
              validate: false,
            ) ??
            Alignment.center,
        autofocus: JsonClass.parseBool(map['autofocus']),
        color: ThemeDecoder.decodeColor(
          map['color'],
          validate: false,
        ),
        constraints: ThemeDecoder.decodeBoxConstraints(
          map['constraints'],
          validate: false,
        ),
        disabledColor: ThemeDecoder.decodeColor(
          map['disabledColor'],
          validate: false,
        ),
        enableFeedback: map['enableFeedback'] == null
            ? true
            : JsonClass.parseBool(map['enableFeedback']),
        focusColor: ThemeDecoder.decodeColor(
          map['focusColor'],
          validate: false,
        ),
        focusNode: map['focusColor'],
        highlightColor: ThemeDecoder.decodeColor(
          map['highlightColor'],
          validate: false,
        ),
        hoverColor: ThemeDecoder.decodeColor(
          map['hoverColor'],
          validate: false,
        ),
        icon: JsonWidgetData.fromDynamic(map['icon']),
        iconSize: JsonClass.parseDouble(map['iconSize'], 24.0)!,
        isSelected: map['isSelected'] == null
            ? null
            : JsonClass.parseBool(map['isSelected']),
        mouseCursor: ThemeDecoder.decodeMouseCursor(
              map['mouseCursor'],
              validate: false,
            ) ??
            SystemMouseCursors.click,
        onPressed: map['onPressed'],
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(
              map['padding'],
              validate: false,
            ) ??
            const EdgeInsets.all(8.0),
        selectedIcon: JsonWidgetData.fromDynamic(map['selectedIcon']),
        splashColor: ThemeDecoder.decodeColor(
          map['splashColor'],
          validate: false,
        ),
        splashRadius: JsonClass.parseDouble(map['splashRadius']),
        style: ThemeDecoder.decodeButtonStyle(
          map['style'],
          validate: false,
        ),
        tooltip: map['tooltip']?.toString(),
        visualDensity: ThemeDecoder.decodeVisualDensity(
          map['visualDensity'],
          validate: false,
        ),
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
    final theIcon = icon ?? getChild(data);

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
      isSelected: isSelected,
      key: key,
      mouseCursor: mouseCursor,
      onPressed: onPressed,
      padding: padding,
      selectedIcon: selectedIcon?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      splashColor: splashColor,
      splashRadius: splashRadius,
      style: style,
      tooltip: tooltip,
      visualDensity: visualDensity,
    );
  }
}

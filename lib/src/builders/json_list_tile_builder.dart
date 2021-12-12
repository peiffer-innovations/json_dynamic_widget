import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [ListTile] widget.  See the [fromDynamic] for the
/// format.
class JsonListTileBuilder extends JsonWidgetBuilder {
  JsonListTileBuilder({
    required this.autofocus,
    this.contentPadding,
    this.dense,
    this.enableFeedback,
    required this.enabled,
    this.focusColor,
    this.focusNode,
    this.horizontalTitleGap,
    this.hoverColor,
    this.iconColor,
    required this.isThreeLine,
    this.leading,
    this.minLeadingWidth,
    this.minVerticalPadding,
    this.mouseCursor,
    this.onLongPress,
    this.onTap,
    required this.selected,
    this.selectedColor,
    this.selectedTileColor,
    this.shape,
    this.style,
    this.subtitle,
    this.textColor,
    this.tileColor,
    this.title,
    this.trailing,
    this.visualDensity,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'list_tile';

  final bool autofocus;
  final EdgeInsetsGeometry? contentPadding;
  final bool? dense;
  final bool? enableFeedback;
  final bool enabled;
  final Color? focusColor;
  final FocusNode? focusNode;
  final double? horizontalTitleGap;
  final Color? hoverColor;
  final Color? iconColor;
  final bool isThreeLine;
  final JsonWidgetData? leading;
  final double? minLeadingWidth;
  final double? minVerticalPadding;
  final MouseCursor? mouseCursor;
  final VoidCallback? onLongPress;
  final VoidCallback? onTap;
  final bool selected;
  final Color? selectedColor;
  final Color? selectedTileColor;
  final ShapeBorder? shape;
  final ListTileStyle? style;
  final JsonWidgetData? subtitle;
  final Color? textColor;
  final Color? tileColor;
  final JsonWidgetData? title;
  final JsonWidgetData? trailing;
  final VisualDensity? visualDensity;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "autofocus": <bool>,
  ///   "contentPadding": <EdgeInsetsGeometry>,
  ///   "dense": <bool>,
  ///   "enableFeedback": <bool>,
  ///   "enabled": <bool>,
  ///   "focusNode": <Color>,
  ///   "focusNode": <FocusNode>,
  ///   "horizontalTitleGap": <double>,
  ///   "hoverColor": <Color>,
  ///   "iconColor": <Color>,
  ///   "isThreeLine": <bool>,
  ///   "leading": <JsonWidgetData>,
  ///   "minLeadingWidth": <double>,
  ///   "minVerticalPadding": <double>,
  ///   "mouseCursor": <MouseCursor>,
  ///   "onLongPress": <VoidCallback>,
  ///   "onTap": <VoidCallback>,
  ///   "selectedColor": <Color>,
  ///   "selected": <bool>,
  ///   "shape": <ShapeBorder>,
  ///   "selectedTileColor": <Color>,
  ///   "style": <ListTileStyle>,
  ///   "subtitle": <JsonWidgetData>,
  ///   "textColor": <Color>,
  ///   "tileColor": <Color>,
  ///   "title": <JsonWidgetData>,
  ///   "trailing": <JsonWidgetData>,
  ///   "visualDensity": <VisualDensity>
  /// }
  /// ```
  ///
  /// As a note, the [VoidCallback] and [FocusNode] objects cannot be decoded
  /// via JSON. Instead, the only way to bind those values to the builder is to
  /// use a function or a variable reference via the [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [JsonWidgetData.fromDynamic]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  ///  * [ThemeDecoder.decodeListTileStyle]
  ///  * [ThemeDecoder.decodeMouseCursor]
  ///  * [ThemeDecoder.decodeShapeBorder]
  ///  * [ThemeDecoder.decodeVisualDensity]
  static JsonListTileBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonListTileBuilder? result;

    if (map != null) {
      result = JsonListTileBuilder(
        autofocus: JsonClass.parseBool(map['autofocus']),
        contentPadding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['contentPadding'],
          validate: false,
        ),
        dense: JsonClass.parseBool(map['dense']),
        enableFeedback: map['enableFeedback'] == null
            ? true
            : JsonClass.parseBool(
                map['enableFeedback'],
              ),
        enabled: map['enabled'] == null
            ? true
            : JsonClass.parseBool(
                map['enabled'],
              ),
        focusColor: ThemeDecoder.decodeColor(
          map['focusColor'],
          validate: false,
        ),
        focusNode: map['focusNode'],
        horizontalTitleGap: JsonClass.parseDouble(map['horizontalTitleGap']),
        hoverColor: ThemeDecoder.decodeColor(
          map['hoverColor'],
          validate: false,
        ),
        iconColor: ThemeDecoder.decodeColor(map['iconColor']),
        isThreeLine: JsonClass.parseBool(map['isThreeLine']),
        leading: JsonWidgetData.fromDynamic(
          map['leading'],
          registry: registry,
        ),
        minLeadingWidth: JsonClass.parseDouble(map['minLeadingWidth']),
        minVerticalPadding: JsonClass.parseDouble(map['minVerticalPadding']),
        mouseCursor: ThemeDecoder.decodeMouseCursor(
          map['mouseCursor'],
          validate: false,
        ),
        onLongPress: map['onLongPress'],
        onTap: map['onTap'],
        selected: JsonClass.parseBool(map['selected']),
        selectedColor: ThemeDecoder.decodeColor(map['selectedColor']),
        selectedTileColor: ThemeDecoder.decodeColor(map['selectedTileColor']),
        shape: ThemeDecoder.decodeShapeBorder(
          map['shape'],
          validate: false,
        ),
        style: ThemeDecoder.decodeListTileStyle(
          map['style'],
          validate: false,
        ),
        subtitle: JsonWidgetData.fromDynamic(
          map['subtitle'],
          registry: registry,
        ),
        textColor: ThemeDecoder.decodeColor(map['textColor']),
        tileColor: ThemeDecoder.decodeColor(map['tileColor']),
        title: JsonWidgetData.fromDynamic(
          map['title'],
          registry: registry,
        ),
        trailing: JsonWidgetData.fromDynamic(
          map['trailing'],
          registry: registry,
        ),
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
    return ListTile(
      autofocus: autofocus,
      contentPadding: contentPadding,
      dense: dense,
      enableFeedback: enableFeedback,
      enabled: enabled,
      focusColor: focusColor,
      focusNode: focusNode,
      horizontalTitleGap: horizontalTitleGap,
      hoverColor: hoverColor,
      iconColor: iconColor,
      isThreeLine: isThreeLine,
      key: key,
      leading: leading?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      minLeadingWidth: minLeadingWidth,
      minVerticalPadding: minVerticalPadding,
      mouseCursor: mouseCursor,
      onLongPress: onLongPress,
      onTap: onTap,
      selected: selected,
      selectedColor: selectedColor,
      selectedTileColor: selectedTileColor,
      shape: shape,
      style: style,
      subtitle: subtitle?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      textColor: textColor,
      tileColor: tileColor,
      title: title?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      trailing: trailing?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      visualDensity: visualDensity,
    );
  }
}

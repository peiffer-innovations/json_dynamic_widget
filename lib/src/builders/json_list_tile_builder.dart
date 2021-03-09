import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    required this.enabled,
    this.focusColor,
    this.focusNode,
    this.hoverColor,
    required this.isThreeLine,
    this.leading,
    this.mouseCursor,
    this.onLongPress,
    this.onTap,
    required this.selected,
    this.selectedTileColor,
    this.shape,
    this.subtitle,
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
  final bool enabled;
  final Color? focusColor;
  final FocusNode? focusNode;
  final Color? hoverColor;
  final bool isThreeLine;
  final JsonWidgetData? leading;
  final MouseCursor? mouseCursor;
  final VoidCallback? onLongPress;
  final VoidCallback? onTap;
  final bool selected;
  final Color? selectedTileColor;
  final ShapeBorder? shape;
  final JsonWidgetData? subtitle;
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
  ///   "enabled": <bool>,
  ///   "focusNode": <Color>,
  ///   "focusNode": <FocusNode>,
  ///   "hoverColor": <Color>,
  ///   "isThreeLine": <bool>,
  ///   "leading": <JsonWidgetData>,
  ///   "mouseCursor": <MouseCursor>,
  ///   "onLongPress": <VoidCallback>,
  ///   "onTap": <VoidCallback>,
  ///   "selected": <bool>,
  ///   "shape": <ShapeBorder>,
  ///   "subtitle": <JsonWidgetData>,
  ///   "selectedTileColor": <Color>,
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
        hoverColor: ThemeDecoder.decodeColor(
          map['hoverColor'],
          validate: false,
        ),
        isThreeLine: JsonClass.parseBool(map['isThreeLine']),
        leading: JsonWidgetData.fromDynamic(
          map['leading'],
          registry: registry,
        ),
        mouseCursor: ThemeDecoder.decodeMouseCursor(
          map['mouseCursor'],
          validate: false,
        ),
        onLongPress: map['onLongPress'],
        onTap: map['onTap'],
        selected: JsonClass.parseBool(map['selected']),
        selectedTileColor: ThemeDecoder.decodeColor(map['selectedTileColor']),
        shape: ThemeDecoder.decodeShapeBorder(
          map['shape'],
          validate: false,
        ),
        subtitle: JsonWidgetData.fromDynamic(
          map['subtitle'],
          registry: registry,
        ),
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
      enabled: enabled,
      focusColor: focusColor,
      focusNode: focusNode,
      hoverColor: hoverColor,
      isThreeLine: isThreeLine,
      key: key,
      leading: leading?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      mouseCursor: mouseCursor,
      onLongPress: onLongPress,
      onTap: onTap,
      selected: selected,
      selectedTileColor: selectedTileColor,
      shape: shape,
      subtitle: subtitle?.build(
        childBuilder: childBuilder,
        context: context,
      ),
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

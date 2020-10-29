import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [PopupMenuButton] widget.  See the [fromDynamic] for the
/// format.
class JsonPopupMenuButtonBuilder extends JsonWidgetBuilder {
  JsonPopupMenuButtonBuilder({
    this.captureInheritedThemes,
    this.color,
    this.elevation,
    this.enabled,
    this.icon,
    this.initialValue,
    @required this.itemBuilder,
    this.offset,
    this.onCanceled,
    this.onSelected,
    this.padding,
    this.shape,
    this.tooltip,
  }) : assert(itemBuilder != null);

  static const type = 'popup_menu_button';

  final bool captureInheritedThemes;
  final Color color;
  final double elevation;
  final bool enabled;
  final JsonWidgetData icon;
  final dynamic initialValue;
  final PopupMenuItemBuilder itemBuilder;
  final Offset offset;
  final PopupMenuCanceled onCanceled;
  final PopupMenuItemSelected onSelected;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;
  final String tooltip;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "captureInheritedThemes": <bool>,
  ///   "color": <Color>,
  ///   "elevation": <double>,
  ///   "enabled": <bool>,
  ///   "icon": <JsonWidgetData>,
  ///   "initialValue": <T>,
  ///   "itemBuilder": <PopupMenuItemBuilder<T>>,
  ///   "offset": <Offset>,
  ///   "onCanceled": <PopupMenuCanceled>,
  ///   "onSelected": <PopupMenuItemSelected<T>>,
  ///   "padding": <EdgeInsetsGeometry>,
  ///   "shape": <ShapeBorder>,
  ///   "tooltip": <String>
  /// }
  /// ```
  ///
  /// As a note, the [PopupMenuItemBuilder<T>], [PopupMenuCanceled] and
  /// [PopupMenuItemSelected<T>] cannot b eecoded via JSON.
  /// Instead, the only way to bind those values to the
  /// builder is to use a function or a variable reference via the
  /// [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [JsonWidgetData.fromDynamic]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  ///  * [ThemeDecoder.decodeOffset]
  ///  * [ThemeDecoder.decodeShapeBorder]
  static JsonPopupMenuButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonPopupMenuButtonBuilder result;

    if (map != null) {
      result = JsonPopupMenuButtonBuilder(
        captureInheritedThemes: map['captureInheritedThemes'] == null
            ? true
            : JsonClass.parseBool(
                map['captureInheritedThemes'],
              ),
        color: ThemeDecoder.decodeColor(
          map['color'],
          validate: false,
        ),
        elevation: JsonClass.parseDouble(
          map['elevation'],
        ),
        enabled: map['enabled'] == null
            ? true
            : JsonClass.parseBool(
                map['enabled'],
              ),
        icon: JsonWidgetData.fromDynamic(
          map['icon'],
          registry: registry,
        ),
        initialValue: map['initialValue'],
        itemBuilder: map['itemBuilder'],
        offset: ThemeDecoder.decodeOffset(
              map['offset'],
              validate: false,
            ) ??
            Offset.zero,
        onCanceled: map['onCanceled'],
        onSelected: map['onSelected'],
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(
              map['padding'],
              validate: false,
            ) ??
            EdgeInsets.all(8.0),
        shape: ThemeDecoder.decodeShapeBorder(
          map['shape'],
          validate: false,
        ),
        tooltip: map['tooltip'],
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
      (data.children?.length == 1 && icon == null) ||
          (data.children?.isNotEmpty != true && icon != null),
      '[JsonPopupMenuButtonBuilder] only supports exactly one child.',
    );

    return PopupMenuButton(
      captureInheritedThemes: captureInheritedThemes,
      color: color,
      elevation: elevation,
      enabled: enabled,
      icon: icon?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      initialValue: initialValue,
      itemBuilder: itemBuilder,
      offset: offset,
      onCanceled: onCanceled,
      onSelected: onSelected,
      padding: padding,
      shape: shape,
      tooltip: tooltip,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

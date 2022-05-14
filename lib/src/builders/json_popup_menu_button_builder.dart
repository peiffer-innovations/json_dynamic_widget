import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build a [PopupMenuButton] widget.  See the [fromDynamic] for the
/// format.
class JsonPopupMenuButtonBuilder extends JsonWidgetBuilder {
  JsonPopupMenuButtonBuilder({
    this.color,
    this.constraints,
    this.elevation,
    this.enableFeedback,
    required this.enabled,
    this.icon,
    this.iconSize,
    this.initialValue,
    required this.itemBuilder,
    required this.offset,
    this.onCanceled,
    this.onSelected,
    required this.padding,
    this.position,
    this.shape,
    this.splashRadius,
    this.tooltip,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'popup_menu_button';

  final Color? color;
  final BoxConstraints? constraints;
  final double? elevation;
  final bool? enableFeedback;
  final bool enabled;
  final JsonWidgetData? icon;
  final double? iconSize;
  final dynamic initialValue;
  final PopupMenuItemBuilder itemBuilder;
  final Offset offset;
  final PopupMenuCanceled? onCanceled;
  final PopupMenuItemSelected? onSelected;
  final EdgeInsetsGeometry padding;
  final PopupMenuPosition? position;
  final ShapeBorder? shape;
  final double? splashRadius;
  final String? tooltip;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "color": <Color>,
  ///   "constraints": <BoxConstraints>,
  ///   "elevation": <double>,
  ///   "enableFeedback": <bool>,
  ///   "enabled": <bool>,
  ///   "icon": <JsonWidgetData>,
  ///   "iconSize": <double>
  ///   "initialValue": <T>,
  ///   "itemBuilder": <PopupMenuItemBuilder<T>>,
  ///   "offset": <Offset>,
  ///   "onCanceled": <PopupMenuCanceled>,
  ///   "onSelected": <PopupMenuItemSelected<T>>,
  ///   "padding": <EdgeInsetsGeometry>,
  ///   "shape": <ShapeBorder>,
  ///   "splashRadius": <SplashRadius>,
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
  ///  * [ThemeDecoder.decodeBoxConstraints]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  ///  * [ThemeDecoder.decodeOffset]
  ///  * [ThemeDecoder.decodePopupMenuPosition]
  ///  * [ThemeDecoder.decodeShapeBorder]
  static JsonPopupMenuButtonBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonPopupMenuButtonBuilder? result;

    if (map != null) {
      result = JsonPopupMenuButtonBuilder(
        color: ThemeDecoder.decodeColor(
          map['color'],
          validate: false,
        ),
        constraints: ThemeDecoder.decodeBoxConstraints(
          map['constraints'],
          validate: false,
        ),
        elevation: JsonClass.parseDouble(
          map['elevation'],
        ),
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
        icon: JsonWidgetData.fromDynamic(
          map['icon'],
          registry: registry,
        ),
        iconSize: JsonClass.parseDouble(map['iconSize']),
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
        position: ThemeDecoder.decodePopupMenuPosition(
          map['position'],
          validate: false,
        ),
        shape: ThemeDecoder.decodeShapeBorder(
          map['shape'],
          validate: false,
        ),
        splashRadius: JsonClass.parseDouble(map['splashRadius']),
        tooltip: map['tooltip'],
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
    var child = getChild(data);

    return PopupMenuButton(
      color: color,
      constraints: constraints,
      elevation: elevation,
      enableFeedback: enableFeedback,
      enabled: enabled,
      icon: icon?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      iconSize: iconSize,
      initialValue: initialValue,
      itemBuilder: itemBuilder,
      key: key,
      offset: offset,
      onCanceled: onCanceled,
      onSelected: onSelected,
      padding: padding,
      position: position ?? PopupMenuPosition.over,
      shape: shape,
      splashRadius: splashRadius,
      tooltip: tooltip,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

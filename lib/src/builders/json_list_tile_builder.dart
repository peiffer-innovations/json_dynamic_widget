import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [ListTile] widget.  See the [fromDynamic] for the
/// format.
class JsonListTileBuilder extends JsonWidgetBuilder {
  JsonListTileBuilder({
    this.contentPadding,
    this.dense,
    this.enabled,
    this.isThreeLine,
    this.leading,
    this.onLongPress,
    this.onTap,
    this.selected,
    this.subtitle,
    this.title,
    this.trailing,
  });

  static const type = 'list_tile';

  final EdgeInsetsGeometry contentPadding;
  final bool dense;
  final bool enabled;
  final bool isThreeLine;
  final JsonWidgetData leading;
  final VoidCallback onLongPress;
  final VoidCallback onTap;
  final bool selected;
  final JsonWidgetData subtitle;
  final JsonWidgetData title;
  final JsonWidgetData trailing;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "contentPadding": <EdgeInsetsGeometry>,
  ///   "dense": <bool>,
  ///   "enabled": <bool>,
  ///   "isThreeLine": <bool>,
  ///   "leading": <JsonWidgetData>,
  ///   "onLongPress": <VoidCallback>,
  ///   "onTap": <VoidCallback>,
  ///   "selected": <bool>,
  ///   "subtitle": <JsonWidgetData>,
  ///   "title": <JsonWidgetData>,
  ///   "trailing": <JsonWidgetData>
  /// }
  /// ```
  ///
  /// As a note, the [VoidCallback] objects cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [JsonWidgetData.fromDynamic]
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  static JsonListTileBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonListTileBuilder result;

    if (map != null) {
      result = JsonListTileBuilder(
        contentPadding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['contentPadding'],
          validate: false,
        ),
        dense: JsonClass.parseBool(map['dense']),
        enabled:
            map['enabled'] == null ? true : JsonClass.parseBool(map['enabled']),
        isThreeLine: JsonClass.parseBool(map['isThreeLine']),
        leading: JsonWidgetData.fromDynamic(
          map['leading'],
          registry: registry,
        ),
        onLongPress: map['onLongPress'],
        onTap: map['onTap'],
        selected: JsonClass.parseBool(map['selected']),
        subtitle: JsonWidgetData.fromDynamic(
          map['subtitle'],
          registry: registry,
        ),
        title: JsonWidgetData.fromDynamic(
          map['title'],
          registry: registry,
        ),
        trailing: JsonWidgetData.fromDynamic(
          map['trailing'],
          registry: registry,
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
    return ListTile(
      contentPadding: contentPadding,
      dense: dense,
      enabled: enabled,
      isThreeLine: isThreeLine,
      leading: leading?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      onLongPress: onLongPress,
      onTap: onTap,
      selected: selected,
      subtitle: subtitle?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      title: title?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      trailing: trailing?.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

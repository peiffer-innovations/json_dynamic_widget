import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [AppBar] widget.  See the [fromDynamic] for the
/// format.
class JsonAppBarBuilder extends JsonWidgetBuilder {
  JsonAppBarBuilder({
    this.actions,
    this.actionsIconTheme,
    this.automaticallyImplyLeading,
    this.backgroundColor,
    this.bottom,
    this.bottomOpacity,
    this.brightness,
    this.centerTitle,
    this.elevation,
    this.excludeHeaderSemantics,
    this.flexibleSpace,
    this.iconTheme,
    this.leading,
    this.primary,
    this.shadowColor,
    this.shape,
    this.textTheme,
    this.title,
    this.titleSpacing,
    this.toolbarHeight,
    this.toolbarOpacity,
  }) : super(preferredSizeWidget: true);

  static const type = 'app_bar';

  final List<JsonWidgetData> actions;
  final IconThemeData actionsIconTheme;
  final bool automaticallyImplyLeading;
  final Color backgroundColor;
  final JsonWidgetData bottom;
  final double bottomOpacity;
  final Brightness brightness;
  final bool centerTitle;
  final double elevation;
  final bool excludeHeaderSemantics;
  final JsonWidgetData flexibleSpace;
  final IconThemeData iconTheme;
  final JsonWidgetData leading;
  final bool primary;
  final Color shadowColor;
  final ShapeBorder shape;
  final TextTheme textTheme;
  final JsonWidgetData title;
  final double titleSpacing;
  final double toolbarHeight;
  final double toolbarOpacity;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "actions": <JsonWidgetData[]>,
  ///   "actionsIconTheme": <IconThemeData>,
  ///   "backgroundColor": <Color>,
  ///   "bottom": <JsonWidgetData>,
  ///   "bottomOpacity": <double>,
  ///   "brightness": <Brightness>,
  ///   "centerTitle": <bool>,
  ///   "elevation": <double>,
  ///   "excludeHeaderSemantics": <bool>,
  ///   "flexibleSpace": <JsonWidgetData>,
  ///   "iconTheme": <IconThemeData>,
  ///   "leading": <bool>,
  ///   "primary": <bool>,
  ///   "shadowColor": <Color>,
  ///   "shape": <ShapeBorder>,
  ///   "textTheme": <TextTheme>,
  ///   "title": <JsonWidgetData>,
  ///   "titleSpacing": <double>,
  ///   "toolbarHeight": <double>,
  ///   "toolbarOpacity": <double>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [JsonWidgetData.fromDynamic]
  ///  * [ThemeDecoder.decodeBrightness]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeIconThemeData]
  ///  * [ThemeDecoder.decodeShapeBorder]
  static JsonAppBarBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonAppBarBuilder result;

    if (map != null) {
      result = JsonAppBarBuilder(
        actions: JsonClass.fromDynamicList(
          map['actions'],
          (map) => JsonWidgetData.fromDynamic(
            map,
            registry: registry,
          ),
        ),
        actionsIconTheme: ThemeDecoder.decodeIconThemeData(
          map['actionsIconTheme'],
          validate: false,
        ),
        automaticallyImplyLeading: map['automaticallyImplyLeading'] == null
            ? true
            : JsonClass.parseBool(map['automaticallyImplyLeading']),
        backgroundColor: ThemeDecoder.decodeColor(
          map['backgroundColor'],
          validate: false,
        ),
        bottom: JsonWidgetData.fromDynamic(
          map['bottom'],
          registry: registry,
        ),
        bottomOpacity: JsonClass.parseDouble(map['bottomOpacity'], 1.0),
        brightness: ThemeDecoder.decodeBrightness(
          map['brightness'],
          validate: false,
        ),
        centerTitle: map['centerTitle'] == null
            ? null
            : JsonClass.parseBool(map['centerTitle']),
        elevation: JsonClass.parseDouble(map['elevation']),
        excludeHeaderSemantics:
            JsonClass.parseBool(map['excludeHeaderSemantics']),
        flexibleSpace: JsonWidgetData.fromDynamic(
          map['flexibleSpace'],
          registry: registry,
        ),
        iconTheme: ThemeDecoder.decodeIconThemeData(
          map['iconTheme'],
          validate: false,
        ),
        leading: JsonWidgetData.fromDynamic(
          map['leading'],
          registry: registry,
        ),
        primary:
            map['primary'] == null ? true : JsonClass.parseBool(map['primary']),
        shadowColor: ThemeDecoder.decodeColor(
          map['shadowColor'],
          validate: false,
        ),
        shape: ThemeDecoder.decodeShapeBorder(
          map['shape'],
          validate: false,
        ),
        textTheme: ThemeDecoder.decodeTextTheme(
          map['textTheme'],
          validate: false,
        ),
        title: JsonWidgetData.fromDynamic(
          map['title'],
          registry: registry,
        ),
        titleSpacing: JsonClass.parseDouble(
          map['titleSpacing'],
          NavigationToolbar.kMiddleSpacing,
        ),
        toolbarHeight: JsonClass.parseDouble(map['toolbarHeight']),
        toolbarOpacity: JsonClass.parseDouble(map['toolbarOpacity'], 1.0),
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
      data.children?.isNotEmpty != true,
      '[JsonAppBarBuilder] does not support children.',
    );

    return AppBar(
      actions: actions == null
          ? null
          : [
              for (var data in actions)
                data.build(
                  childBuilder: childBuilder,
                  context: context,
                ),
            ],
      actionsIconTheme: actionsIconTheme,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor,
      bottom: bottom?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      bottomOpacity: bottomOpacity,
      brightness: brightness,
      centerTitle: centerTitle,
      elevation: elevation,
      excludeHeaderSemantics: excludeHeaderSemantics,
      flexibleSpace: flexibleSpace?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      iconTheme: iconTheme,
      leading: leading?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      primary: primary,
      shadowColor: shadowColor,
      shape: shape,
      textTheme: textTheme,
      title: title?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      titleSpacing: titleSpacing,
      toolbarHeight: toolbarHeight,
      toolbarOpacity: toolbarOpacity,
    );
  }
}

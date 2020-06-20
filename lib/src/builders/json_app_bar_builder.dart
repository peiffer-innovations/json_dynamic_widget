import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

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
    this.shape,
    this.textTheme,
    this.title,
    this.titleSpacing,
    this.toolbarOpacity,
  });

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
  final ShapeBorder shape;
  final TextTheme textTheme;
  final JsonWidgetData title;
  final double titleSpacing;
  final double toolbarOpacity;

  static JsonAppBarBuilder fromDynamic(dynamic map) {
    JsonAppBarBuilder result;

    if (map != null) {
      result = JsonAppBarBuilder(
        actions: JsonClass.fromDynamicList(
          map['actions'],
          (map) => JsonWidgetData.fromDynamic(map),
        ),
        actionsIconTheme: ThemeDecoder.decodeIconThemeData(
          map['actionsIconTheme'],
        ),
        automaticallyImplyLeading: map['automaticallyImplyLeading'] == null
            ? true
            : JsonClass.parseBool(map['automaticallyImplyLeading']),
        backgroundColor: ThemeDecoder.decodeColor(map['backgroundColor']),
        bottom: JsonWidgetData.fromDynamic(map['bottom']),
        bottomOpacity: JsonClass.parseDouble(map['bottomOpacity'], 1.0),
        brightness: ThemeDecoder.decodeBrightness(map['brightness']),
        centerTitle: map['centerTitle'] == null
            ? null
            : JsonClass.parseBool(map['centerTitle']),
        elevation: JsonClass.parseDouble(map['elevation']),
        excludeHeaderSemantics:
            JsonClass.parseBool(map['excludeHeaderSemantics']),
        flexibleSpace: JsonWidgetData.fromDynamic(map['flexibleSpace']),
        iconTheme: ThemeDecoder.decodeIconThemeData(map['iconTheme']),
        leading: JsonWidgetData.fromDynamic(map['leading']),
        primary:
            map['primary'] == null ? true : JsonClass.parseBool(map['primary']),
        shape: ThemeDecoder.decodeShapeBorder(map['shape']),
        textTheme: ThemeDecoder.decodeTextTheme(map['textTheme']),
        title: JsonWidgetData.fromDynamic(map['title']),
        titleSpacing: JsonClass.parseDouble(
          map['titleSpacing'],
          NavigationToolbar.kMiddleSpacing,
        ),
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
      shape: shape,
      textTheme: textTheme,
      title: title?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOpacity,
    );
  }
}

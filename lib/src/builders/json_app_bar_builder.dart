import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [AppBar] widget.  See the [fromDynamic] for the
/// format.
class JsonAppBarBuilder extends JsonWidgetBuilder {
  JsonAppBarBuilder({
    this.actions,
    this.actionsIconTheme,
    required this.automaticallyImplyLeading,
    this.backgroundColor,
    this.bottom,
    required this.bottomOpacity,
    this.centerTitle,
    this.elevation,
    required this.excludeHeaderSemantics,
    this.flexibleSpace,
    this.foregroundColor,
    this.iconTheme,
    this.leading,
    this.leadingWidth,
    required this.primary,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.shape,
    this.surfaceTintColor,
    this.systemOverlayStyle,
    this.titleTextStyle,
    this.toolbarTextStyle,
    this.title,
    this.titleSpacing,
    this.toolbarHeight,
    required this.toolbarOpacity,
  }) : super(
          numSupportedChildren: kNumSupportedChildren,
          preferredSizeWidget: true,
        );

  static const kNumSupportedChildren = 0;
  static const type = 'app_bar';

  final List<JsonWidgetData>? actions;
  final IconThemeData? actionsIconTheme;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final JsonWidgetData? bottom;
  final double bottomOpacity;
  final bool? centerTitle;
  final double? elevation;
  final bool excludeHeaderSemantics;
  final JsonWidgetData? flexibleSpace;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final JsonWidgetData? leading;
  final double? leadingWidth;
  final bool primary;
  final double? scrolledUnderElevation;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? surfaceTintColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final TextStyle? titleTextStyle;
  final TextStyle? toolbarTextStyle;
  final JsonWidgetData? title;
  final double? titleSpacing;
  final double? toolbarHeight;
  final double toolbarOpacity;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "actions": <JsonWidgetData[]>,
  ///   "actionsIconTheme": <IconThemeData>,
  ///   "automaticallyImplyLeading": <bool>,
  ///   "backgroundColor": <Color>,
  ///   "bottom": <JsonWidgetData>,
  ///   "bottomOpacity": <double>,
  ///   "centerTitle": <bool>,
  ///   "elevation": <double>,
  ///   "excludeHeaderSemantics": <bool>,
  ///   "flexibleSpace": <JsonWidgetData>,
  ///   "foregroundColor": <Color>,
  ///   "iconTheme": <IconThemeData>,
  ///   "leading": <bool>,
  ///   "leadingWidth": <double>,
  ///   "primary": <bool>,
  ///   "scrolledUnderElevation": <double>,
  ///   "shadowColor": <Color>,
  ///   "shape": <ShapeBorder>,
  ///   "surfaceTintColor": <Color>,
  ///   "systemOverlayStyle": <SystemUiOverlayStyle>,
  ///   "titleTextStyle": <TextStyle>,
  ///   "toolbarTextStyle": <TextStyle>,
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
  static JsonAppBarBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonAppBarBuilder? result;

    if (map != null) {
      result = JsonAppBarBuilder(
        actions: JsonClass.fromDynamicList(
          map['actions'],
          (map) => JsonWidgetData.fromDynamic(
            map,
            registry: registry,
          )!,
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
        bottomOpacity: JsonClass.parseDouble(map['bottomOpacity'], 1.0)!,
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
        leadingWidth: JsonClass.parseDouble(map['leadingWidth']),
        primary:
            map['primary'] == null ? true : JsonClass.parseBool(map['primary']),
        scrolledUnderElevation: JsonClass.parseDouble(
          map['scrolledUnderElevation'],
        ),
        shadowColor: ThemeDecoder.decodeColor(
          map['shadowColor'],
          validate: false,
        ),
        shape: ThemeDecoder.decodeShapeBorder(
          map['shape'],
          validate: false,
        ),
        surfaceTintColor: ThemeDecoder.decodeColor(
          map['surfaceTintColor'],
          validate: false,
        ),
        systemOverlayStyle: ThemeDecoder.decodeSystemUiOverlayStyle(
          map['systemOverlayStyle'],
          validate: false,
        ),
        titleTextStyle: ThemeDecoder.decodeTextStyle(
          map['titleTextStyle'],
          validate: false,
        ),
        toolbarTextStyle: ThemeDecoder.decodeTextStyle(
          map['toolbarTextStyle'],
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
        toolbarOpacity: JsonClass.parseDouble(map['toolbarOpacity'], 1.0)!,
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
    assert(
      data.children?.isNotEmpty != true,
      '[JsonAppBarBuilder] does not support children.',
    );

    return AppBar(
      actions: actions == null
          ? null
          : [
              for (var data in actions!)
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
      ) as PreferredSizeWidget?,
      bottomOpacity: bottomOpacity,
      centerTitle: centerTitle,
      elevation: elevation,
      excludeHeaderSemantics: excludeHeaderSemantics,
      flexibleSpace: flexibleSpace?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      foregroundColor: foregroundColor,
      iconTheme: iconTheme,
      key: key,
      leading: leading?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      leadingWidth: leadingWidth,
      primary: primary,
      scrolledUnderElevation: scrolledUnderElevation,
      shadowColor: shadowColor,
      shape: shape,
      surfaceTintColor: surfaceTintColor,
      systemOverlayStyle: systemOverlayStyle,
      title: title?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      titleTextStyle: titleTextStyle,
      toolbarTextStyle: toolbarTextStyle,
      titleSpacing: titleSpacing,
      toolbarHeight: toolbarHeight,
      toolbarOpacity: toolbarOpacity,
    );
  }
}

import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [RaisedButton] widget.  See the [fromDynamic] for
/// the format.
class JsonRaisedButtonBuilder extends JsonWidgetBuilder {
  JsonRaisedButtonBuilder({
    this.animationDuration,
    this.autofocus,
    this.clipBehavior,
    this.color,
    this.colorBrightness,
    this.disabledColor,
    this.disabledElevation,
    this.disabledTextColor,
    this.elevation,
    this.focusColor,
    this.focusElevation,
    this.focusNode,
    this.highlightColor,
    this.highlightElevation,
    this.hoverColor,
    this.hoverElevation,
    this.materialTapTargetSize,
    this.mouseCursor,
    this.onHighlightChanged,
    this.onPressed,
    this.onLongPress,
    this.padding,
    this.shape,
    this.splashColor,
    this.textColor,
    this.textTheme,
    this.visualDensity,
  });

  static const type = 'raised_button';

  final Duration animationDuration;
  final bool autofocus;
  final Clip clipBehavior;
  final Color color;
  final Brightness colorBrightness;
  final Color disabledColor;
  final double disabledElevation;
  final Color disabledTextColor;
  final double elevation;
  final Color focusColor;
  final double focusElevation;
  final FocusNode focusNode;
  final Color highlightColor;
  final double highlightElevation;
  final Color hoverColor;
  final double hoverElevation;
  final MaterialTapTargetSize materialTapTargetSize;
  final MouseCursor mouseCursor;
  final ValueChanged<bool> onHighlightChanged;
  final VoidCallback onPressed;
  final VoidCallback onLongPress;
  final EdgeInsets padding;
  final ShapeBorder shape;
  final Color splashColor;
  final Color textColor;
  final ButtonTextTheme textTheme;
  final VisualDensity visualDensity;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "animationDuration": <int; millis>,
  ///   "autofocus": <bool>,
  ///   "clipBehavior": <Clip>,
  ///   "color": <Color>,
  ///   "colorBrightness": <Brightness>,
  ///   "disabledColor": <Color>,
  ///   "disabledElevation": <double>,
  ///   "disabledTextColor": <Color>>,
  ///   "elevation": <double>,
  ///   "focusColor": <Color>,
  ///   "focusElevation": <double>,
  ///   "focusNode": <FocusNode>,
  ///   "highlightColor": <Color>,
  ///   "highlightElevation": <double>,
  ///   "hoverColor": <Color>,
  ///   "hoverElevation": <double>,
  ///   "materialTapTargetSize": <MaterialTapTargetSize>,
  ///   "mouseCursor": <MouseCursor>,
  ///   "onHighlightChanged": <ValueCallback<bool>>,
  ///   "onPressed": <VoidCallback>,
  ///   "onLongPress": <VoidCallback>,
  ///   "padding": <EdgeInsetsGeometry>,
  ///   "shape": <ShapeBorder>,
  ///   "splashColor": <Color>,
  ///   "textColor": <Color>,
  ///   "textTheme": <ButtonTextTheme>,
  ///   "visualDensity": <VisualDensity>
  /// }
  /// ```
  ///
  /// As a note, the [FocusNode], [ValueCallback<bool>], and [VoidCallback]
  /// cannot be decoded via JSON.  Instead, the only way to bind those values to
  /// the builder is to use a function or a variable reference via the
  /// [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeBrightness]
  ///  * [ThemeDecoder.decodeClip]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeBoxDirection]
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  ///  * [ThemeDecoder.decodeMaterialTapTargetSize]
  ///  * [ThemeDecoder.decodeMouseCursor]
  ///  * [ThemeDecoder.decodeShapeBorder]
  ///  * [ThemeDecoder.decodeButtonTextTheme]
  ///  * [ThemeDecoder.decodeVisualDensity]
  static JsonRaisedButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonRaisedButtonBuilder result;

    if (map != null) {
      result = JsonRaisedButtonBuilder(
        animationDuration:
            JsonClass.parseDurationFromMillis(map['animationDuration']),
        autofocus: JsonClass.parseBool(map['autofocus']),
        clipBehavior: ThemeDecoder.decodeClip(
              map['clipBehavior'],
              validate: false,
            ) ??
            Clip.none,
        color: ThemeDecoder.decodeColor(
          map['color'],
          validate: false,
        ),
        colorBrightness: ThemeDecoder.decodeBrightness(
          map['colorBrightness'],
          validate: false,
        ),
        disabledColor: ThemeDecoder.decodeColor(
          map['disabledColor'],
          validate: false,
        ),
        disabledElevation: JsonClass.parseDouble(map['disabledElevation']),
        disabledTextColor: ThemeDecoder.decodeColor(
          map['disabledTextColor'],
          validate: false,
        ),
        elevation: JsonClass.parseDouble(map['elevation']),
        focusColor: ThemeDecoder.decodeColor(
          map['focusColor'],
          validate: false,
        ),
        focusElevation: JsonClass.parseDouble(map['focusElevation']),
        focusNode: map['focusNode'],
        highlightColor: ThemeDecoder.decodeColor(
          map['highlightColor'],
          validate: false,
        ),
        highlightElevation: JsonClass.parseDouble(map['highlightElevation']),
        hoverColor: ThemeDecoder.decodeColor(
          map['hoverColor'],
          validate: false,
        ),
        hoverElevation: JsonClass.parseDouble(map['hoverElevation']),
        materialTapTargetSize: ThemeDecoder.decodeMaterialTapTargetSize(
          map['materialTapTargetSize'],
          validate: false,
        ),
        mouseCursor: ThemeDecoder.decodeMouseCursor(map['mouseCursor']),
        onHighlightChanged: map['onHighlightChanged'],
        onPressed: map['onPressed'],
        onLongPress: map['onLongPress'],
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['padding'],
          validate: false,
        ),
        shape: ThemeDecoder.decodeShapeBorder(
          map['shape'],
          validate: false,
        ),
        splashColor: ThemeDecoder.decodeColor(
          map['splashColor'],
          validate: false,
        ),
        textColor: ThemeDecoder.decodeColor(
          map['textColor'],
          validate: false,
        ),
        textTheme: ThemeDecoder.decodeButtonTextTheme(
          map['textTheme'],
          validate: false,
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
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.length == 1,
      '[JsonRaisedButtonBuilder] only supports exactly one child.',
    );

    return RaisedButton(
      animationDuration: animationDuration,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      color: color,
      colorBrightness: colorBrightness,
      disabledColor: disabledColor,
      disabledElevation: disabledElevation,
      disabledTextColor: disabledTextColor,
      elevation: elevation,
      focusColor: focusColor,
      focusElevation: focusElevation,
      focusNode: focusNode,
      highlightColor: highlightColor,
      highlightElevation: highlightElevation,
      hoverColor: hoverColor,
      hoverElevation: hoverElevation,
      materialTapTargetSize: materialTapTargetSize,
      mouseCursor: mouseCursor,
      onHighlightChanged: onHighlightChanged,
      onPressed: onPressed,
      onLongPress: onLongPress,
      padding: padding,
      shape: shape,
      splashColor: splashColor,
      textColor: textColor,
      textTheme: textTheme,
      visualDensity: visualDensity,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

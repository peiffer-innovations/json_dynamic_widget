import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [FlatButton] widget.  See the [fromDynamic] for
/// the format.
class JsonFlatButtonBuilder extends JsonWidgetBuilder {
  JsonFlatButtonBuilder({
    this.autofocus,
    this.clipBehavior,
    this.color,
    this.colorBrightness,
    this.disabledColor,
    this.disabledTextColor,
    this.focusColor,
    this.focusNode,
    this.highlightColor,
    this.hoverColor,
    this.materialTapTargetSize,
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

  static const type = 'flat_button';

  final bool autofocus;
  final Clip clipBehavior;
  final Color color;
  final Brightness colorBrightness;
  final Color disabledColor;
  final Color disabledTextColor;
  final Color focusColor;
  final FocusNode focusNode;
  final Color highlightColor;
  final Color hoverColor;
  final MaterialTapTargetSize materialTapTargetSize;
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
  ///   "autofocus": <bool>,
  ///   "clipBehavior": <Clip>,
  ///   "color": <Color>,
  ///   "colorBrightness": <Brightness>,
  ///   "disabledColor": <Color>,
  ///   "disabledTextColor": <Color>,
  ///   "focusColor": <Color>,
  ///   "focusNode": <FocusNode>,
  ///   "highlightColor": <Color>,
  ///   "hoverColor": <Color>,
  ///   "materialTapTargetSize": <MaterialTapTargetSize>,
  ///   "onHighlightChanged": <ValueChanged<bool>>,
  ///   "onPressed": <VoidCallback>,
  ///   "onLongPress": <VoidCallback>,
  ///   "padding": <EdgeInsetsGeometry>,
  ///   "shape": <ShapeBorder>,
  ///   "splashColor": <Color>,
  ///   "textColor": <Color>,
  ///   "textTheme": <ButtonTextTheme>,
  ///   "visualDensity": <VisualDensity>,
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
  ///  * [ThemeDecoder.decodeShapeBorder]
  ///  * [ThemeDecoder.decodeButtonTextTheme]
  ///  * [ThemeDecoder.decodeVisualDensity]
  static JsonFlatButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonFlatButtonBuilder result;

    if (map != null) {
      result = JsonFlatButtonBuilder(
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
        disabledTextColor: ThemeDecoder.decodeColor(
          map['disabledTextColor'],
          validate: false,
        ),
        focusColor: ThemeDecoder.decodeColor(
          map['focusColor'],
          validate: false,
        ),
        focusNode: map['focusNode'],
        highlightColor: ThemeDecoder.decodeColor(
          map['highlightColor'],
          validate: false,
        ),
        hoverColor: ThemeDecoder.decodeColor(
          map['hoverColor'],
          validate: false,
        ),
        materialTapTargetSize: ThemeDecoder.decodeMaterialTapTargetSize(
          map['materialTapTargetSize'],
          validate: false,
        ),
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
      '[JsonFlatButtonBuilder] only supports exactly one child.',
    );

    return FlatButton(
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      color: color,
      colorBrightness: colorBrightness,
      disabledColor: disabledColor,
      disabledTextColor: disabledTextColor,
      focusColor: focusColor,
      focusNode: focusNode,
      highlightColor: highlightColor,
      hoverColor: hoverColor,
      materialTapTargetSize: materialTapTargetSize,
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

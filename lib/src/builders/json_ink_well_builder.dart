import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [InkWell] widget.  See the [fromDynamic] for the
/// format.
class JsonInkWellBuilder extends JsonWidgetBuilder {
  JsonInkWellBuilder({
    this.autofocus,
    this.borderRadius,
    this.canRequestFocus,
    this.customBorder,
    this.enableFeedback,
    this.excludeFromSemantics,
    this.focusColor,
    this.focusNode,
    this.highlightColor,
    this.hoverColor,
    this.onDoubleTap,
    this.onFocusChange,
    this.onHighlightChanged,
    this.onHover,
    this.onLongPress,
    this.onTap,
    this.onTapCancel,
    this.onTapDown,
    this.radius,
    this.splashColor,
    this.splashFactory,
  });

  static const type = 'ink_well';

  final bool autofocus;
  final BorderRadius borderRadius;
  final bool canRequestFocus;
  final ShapeBorder customBorder;
  final bool enableFeedback;
  final bool excludeFromSemantics;
  final Color focusColor;
  final FocusNode focusNode;
  final Color highlightColor;
  final Color hoverColor;
  final GestureTapCallback onDoubleTap;
  final ValueChanged<bool> onFocusChange;
  final ValueChanged<bool> onHighlightChanged;
  final ValueChanged<bool> onHover;
  final GestureLongPressCallback onLongPress;
  final GestureTapCallback onTap;
  final GestureTapCancelCallback onTapCancel;
  final GestureTapDownCallback onTapDown;
  final double radius;
  final Color splashColor;
  final InteractiveInkFeatureFactory splashFactory;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "autofocus": <bool>,
  ///   "borderRadius": <BorderRadius>,
  ///   "canRequestFocus": <bool>,
  ///   "customBorder": <ShapeBorder>,
  ///   "enableFeedback": <bool>,
  ///   "excludeFromSemantics": <bool>,
  ///   "focusColor": <Color>,
  ///   "focusNode": <FocusNode>,
  ///   "highlightColor": <Color>,
  ///   "hoverColor": <Color>,
  ///   "onDoubleTap": <GestureTapCallback>,
  ///   "onFocusChange": <ValueChanged<bool>>,
  ///   "onHighlightChanged": <ValueChanged<bool>>,
  ///   "onHover": <ValueChanged<bool>>,
  ///   "onLongPress": <GestureLongPressCallback>,
  ///   "onTap": <GestureTapCallback>,
  ///   "onTapCancel": <GestureTapCancelCallback>,
  ///   "onTapDown": <GestureTapDownCallback>,
  ///   "radius": <double>,
  ///   "splashColor": <Color>,
  ///   "splashFactory": <InteractiveInkFeatureFactory>
  /// }
  /// ```
  ///
  /// As a note, the [FocusNode], [GestureTapCallback],
  /// [GestureLongPressCallback], [GestureTapCancelCallback],
  /// [GestureTapDownCallback], [ValueCallback<bool>], and [VoidCallback] cannot
  /// be decoded via JSON.  Instead, the only way to bind those values to the
  /// builder is to use a function or a variable reference via the
  /// [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeBorderRadius]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeInteractiveInkFeatureFactory]
  ///  * [ThemeDecoder.decodeShapeBorder]
  static JsonInkWellBuilder fromDynamic(dynamic map) {
    JsonInkWellBuilder result;

    if (map != null) {
      result = JsonInkWellBuilder(
        autofocus: JsonClass.parseBool(map['autofocus']),
        borderRadius: ThemeDecoder.decodeBorderRadius(map['borderRadius']),
        canRequestFocus: map['canRequestFocus'] == null
            ? true
            : JsonClass.parseBool(map['canRequestFocus']),
        customBorder: ThemeDecoder.decodeShapeBorder(map['customBorder']),
        enableFeedback: map['enableFeedback'] == null
            ? true
            : JsonClass.parseBool(map['enableFeedback']),
        excludeFromSemantics: JsonClass.parseBool(map['excludeFromSemantics']),
        focusColor: ThemeDecoder.decodeColor(map['focusColor']),
        focusNode: map['focusNode'],
        highlightColor: ThemeDecoder.decodeColor(map['highlightColor']),
        hoverColor: ThemeDecoder.decodeColor(map['hoverColor']),
        onDoubleTap: map['onDoubleTap'],
        onFocusChange: map['onFocusChange'],
        onHighlightChanged: map['onHighlightChanged'],
        onHover: map['onHover'],
        onLongPress: map['onLongPress'],
        onTap: map['onTap'],
        onTapCancel: map['onTapCancel'],
        onTapDown: map['onTapDown'],
        radius: JsonClass.parseDouble(map['radius']),
        splashColor: ThemeDecoder.decodeColor(map['splashColor']),
        splashFactory: ThemeDecoder.decodeInteractiveInkFeatureFactory(
          map['splashFactory'],
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
      '[JsonInkWellBuilder] only supports exactly one child.',
    );

    return InkWell(
      autofocus: autofocus,
      borderRadius: borderRadius,
      canRequestFocus: canRequestFocus,
      customBorder: customBorder,
      enableFeedback: enableFeedback,
      excludeFromSemantics: excludeFromSemantics,
      focusColor: focusColor,
      focusNode: focusNode,
      highlightColor: highlightColor,
      hoverColor: hoverColor,
      onDoubleTap: onDoubleTap,
      onFocusChange: onFocusChange,
      onHighlightChanged: onHighlightChanged,
      onHover: onHover,
      onLongPress: onLongPress,
      onTap: onTap,
      onTapCancel: onTapCancel,
      onTapDown: onTapDown,
      radius: radius,
      splashColor: splashColor,
      splashFactory: splashFactory,
    );
  }
}

import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [InkWell] widget.  See the [fromDynamic] for the
/// format.
class JsonInkWellBuilder extends JsonWidgetBuilder {
  JsonInkWellBuilder({
    required this.autofocus,
    this.borderRadius,
    required this.canRequestFocus,
    this.customBorder,
    this.enableFeedback,
    required this.excludeFromSemantics,
    this.focusColor,
    this.focusNode,
    this.highlightColor,
    this.hoverColor,
    this.mouseCursor,
    this.onDoubleTap,
    this.onFocusChange,
    this.onHighlightChanged,
    this.onHover,
    this.onLongPress,
    this.onTap,
    this.onTapCancel,
    this.onTapDown,
    this.onTapUp,
    this.overlayColor,
    this.radius,
    this.splashColor,
    this.splashFactory,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'ink_well';

  final bool autofocus;
  final BorderRadius? borderRadius;
  final bool canRequestFocus;
  final ShapeBorder? customBorder;
  final bool? enableFeedback;
  final bool excludeFromSemantics;
  final Color? focusColor;
  final FocusNode? focusNode;
  final Color? highlightColor;
  final Color? hoverColor;
  final MouseCursor? mouseCursor;
  final GestureTapCallback? onDoubleTap;
  final ValueChanged<bool>? onFocusChange;
  final ValueChanged<bool>? onHighlightChanged;
  final ValueChanged<bool>? onHover;
  final GestureLongPressCallback? onLongPress;
  final GestureTapCallback? onTap;
  final GestureTapCancelCallback? onTapCancel;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? radius;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;

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
  ///   "mouseCursor": <MouseCursor>,
  ///   "onDoubleTap": <GestureTapCallback>,
  ///   "onFocusChange": <ValueChanged<bool>>,
  ///   "onHighlightChanged": <ValueChanged<bool>>,
  ///   "onHover": <ValueChanged<bool>>,
  ///   "onLongPress": <GestureLongPressCallback>,
  ///   "onTap": <GestureTapCallback>,
  ///   "onTapCancel": <GestureTapCancelCallback>,
  ///   "onTapDown": <GestureTapDownCallback>,
  ///   "onTapUp": <GestureTapUpCallback>,
  ///   "overlayColor": <MaterialStatePropertyColor>,
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
  ///  * [ThemeDecoder.decodeMouseCursor]
  ///  * [ThemeDecoder.decodeShapeBorder]
  static JsonInkWellBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonInkWellBuilder? result;

    if (map != null) {
      result = JsonInkWellBuilder(
        autofocus: JsonClass.parseBool(map['autofocus']),
        borderRadius: ThemeDecoder.decodeBorderRadius(
          map['borderRadius'],
          validate: false,
        ),
        canRequestFocus: map['canRequestFocus'] == null
            ? true
            : JsonClass.parseBool(map['canRequestFocus']),
        customBorder: ThemeDecoder.decodeShapeBorder(
          map['customBorder'],
          validate: false,
        ),
        enableFeedback: map['enableFeedback'] == null
            ? true
            : JsonClass.parseBool(map['enableFeedback']),
        excludeFromSemantics: JsonClass.parseBool(map['excludeFromSemantics']),
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
        mouseCursor: ThemeDecoder.decodeMouseCursor(
          map['mouseCursor'],
          validate: false,
        ),
        onDoubleTap: map['onDoubleTap'],
        onFocusChange: map['onFocusChange'],
        onHighlightChanged: map['onHighlightChanged'],
        onHover: map['onHover'],
        onLongPress: map['onLongPress'],
        onTap: map['onTap'],
        onTapCancel: map['onTapCancel'],
        onTapDown: map['onTapDown'],
        onTapUp: map['onTapUp'],
        overlayColor: ThemeDecoder.decodeMaterialStatePropertyColor(
          map['overlayColor'],
          validate: false,
        ),
        radius: JsonClass.parseDouble(map['radius']),
        splashColor: ThemeDecoder.decodeColor(
          map['splashColor'],
          validate: false,
        ),
        splashFactory: ThemeDecoder.decodeInteractiveInkFeatureFactory(
          map['splashFactory'],
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
    var child = getChild(data);

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
      key: key,
      mouseCursor: mouseCursor,
      onDoubleTap: onDoubleTap,
      onFocusChange: onFocusChange,
      onHighlightChanged: onHighlightChanged,
      onHover: onHover,
      onLongPress: onLongPress,
      onTap: onTap,
      onTapCancel: onTapCancel,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      overlayColor: overlayColor,
      radius: radius,
      splashColor: splashColor,
      splashFactory: splashFactory,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

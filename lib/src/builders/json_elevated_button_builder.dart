import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [ElevatedButton] widget.  See the [fromDynamic] for
/// the format.
class JsonElevatedButtonBuilder extends JsonWidgetBuilder {
  JsonElevatedButtonBuilder({
    this.autofocus,
    this.backgroundColorCallback,
    this.clipBehavior,
    this.elevationCallback,
    this.focusNode,
    this.foregroundColorCallback,
    this.minimumSizeCallback,
    this.mouseCursorCallback,
    this.onLongPress,
    this.onPressed,
    this.overlayColorCallback,
    this.paddingCallback,
    this.shadowColorCallback,
    this.shapeCallback,
    this.sideCallback,
    this.style,
    this.textStyleCallback,
  });

  static const type = 'elevated_button';

  final bool autofocus;
  final MaterialColor Function(Set<MaterialState>) backgroundColorCallback;
  final Clip clipBehavior;
  final double Function(Set<MaterialState>) elevationCallback;
  final FocusNode focusNode;
  final MaterialColor Function(Set<MaterialState>) foregroundColorCallback;
  final Size Function(Set<MaterialState>) minimumSizeCallback;
  final MouseCursor Function(Set<MaterialState>) mouseCursorCallback;
  final VoidCallback onLongPress;
  final VoidCallback onPressed;
  final MaterialColor Function(Set<MaterialState>) overlayColorCallback;
  final EdgeInsetsGeometry Function(Set<MaterialState>) paddingCallback;
  final MaterialColor Function(Set<MaterialState>) shadowColorCallback;
  final OutlinedBorder Function(Set<MaterialState>) shapeCallback;
  final BorderSide Function(Set<MaterialState>) sideCallback;
  final ButtonStyle style;
  final TextStyle Function(Set<MaterialState>) textStyleCallback;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "autofocus": <bool>,
  ///   "backgroundColorCallback": <MaterialColor Function(Set<MaterialState>)>,
  ///   "clipBehavior": <Clip>,
  ///   "elevationCallback": <double Function(Set<MaterialState>)>,
  ///   "focusNode": <FocusNode>,
  ///   "foregroundColorCallback": <MaterialColor Function(Set<MaterialState>)>,
  ///   "minimumSizeCallback": <Size Function(Set<MaterialState>)>,
  ///   "mouseCursorCallback": <MouseCursor Function(Set<MaterialState>)>,
  ///   "onLongPress": <VoidCallback>,
  ///   "onPressed": <VoidCallback>,
  ///   "overlayColorCallback": <MaterialColor Function(Set<MaterialState>)>,
  ///   "paddingCallback": <EdgeInsetsGeometry Function(Set<MaterialState>)>,
  ///   "shadowColorCallback": <MaterialColor Function(Set<MaterialState>)>,
  ///   "shapeCallback": <OutlinedBorder Function(Set<MaterialState>)>,
  ///   "sideCallback": <BorderSide Function(Set<MaterialState>)>,
  ///   "style": <ButtonStyle>,
  ///   "textStyleCallback": <TextStyle Function(Set<MaterialState>)>
  /// }
  /// ```
  ///
  /// Each [Function(Set<MaterialState>)] should be passed as part of the
  /// `style` property. It's important to know that each
  /// [Function(Set<MaterialState>)] will be used as parameter for the
  /// [MaterialStateProperty.resolveWith] function.
  ///
  /// As a note, the [FocusNode], [VoidCallback], and each
  /// [Function(Set<MaterialState>)] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to
  /// the builder is to use a function or a variable reference via the
  /// [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeClip]
  ///  * [ThemeDecoder.decodeButtonStyle]
  static JsonElevatedButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonElevatedButtonBuilder result;

    if (map != null) {
      var tempMap = Map.from(map['style'] ?? {});

      var backgroundColorCallback = tempMap.remove('backgroundColor');
      var elevationCallback = tempMap.remove('elevation');
      var foregroundColorCallback = tempMap.remove('foregroundColor');
      var minimumSizeCallback = tempMap.remove('minimumSize');
      var mouseCursorCallback = tempMap.remove('mouseCursor');
      var overlayColorCallback = tempMap.remove('overlayColor');
      var paddingCallback = tempMap.remove('padding');
      var shadowColorCallback = tempMap.remove('shadowColor');
      var shapeCallback = tempMap.remove('shape');
      var sideCallback = tempMap.remove('side');
      var textStyleCallback = tempMap.remove('textStyle');

      result = JsonElevatedButtonBuilder(
        autofocus: map['autofocus'] == null
            ? false
            : JsonClass.parseBool(
                map['autofocus'],
              ),
        backgroundColorCallback: backgroundColorCallback,
        clipBehavior: ThemeDecoder.decodeClip(
              map['clipBehavior'],
            ) ??
            Clip.none,
        elevationCallback: elevationCallback,
        focusNode: map['focusNode'],
        foregroundColorCallback: foregroundColorCallback,
        minimumSizeCallback: minimumSizeCallback,
        mouseCursorCallback: mouseCursorCallback,
        onLongPress: map['onLongPress'],
        onPressed: map['onPressed'],
        overlayColorCallback: overlayColorCallback,
        paddingCallback: paddingCallback,
        shadowColorCallback: shadowColorCallback,
        shapeCallback: shapeCallback,
        sideCallback: sideCallback,
        style: ThemeDecoder.decodeButtonStyle(
          tempMap,
          validate: false,
        ),
        textStyleCallback: textStyleCallback,
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.length == 1,
      '[JsonElevatedButtonBuilder] only supports exactly one child.',
    );

    return ElevatedButton(
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      onLongPress: onLongPress,
      onPressed: onPressed,
      style: ButtonStyle(
        animationDuration: style.animationDuration,
        backgroundColor: backgroundColorCallback != null
            ? MaterialStateProperty.resolveWith(
                backgroundColorCallback,
              )
            : null,
        elevation: elevationCallback != null
            ? MaterialStateProperty.resolveWith(
                elevationCallback,
              )
            : null,
        enableFeedback: style.enableFeedback,
        foregroundColor: foregroundColorCallback != null
            ? MaterialStateProperty.resolveWith(
                foregroundColorCallback,
              )
            : null,
        minimumSize: minimumSizeCallback != null
            ? MaterialStateProperty.resolveWith(
                minimumSizeCallback,
              )
            : null,
        mouseCursor: mouseCursorCallback != null
            ? MaterialStateProperty.resolveWith(
                mouseCursorCallback,
              )
            : null,
        overlayColor: overlayColorCallback != null
            ? MaterialStateProperty.resolveWith(
                overlayColorCallback,
              )
            : null,
        padding: paddingCallback != null
            ? MaterialStateProperty.resolveWith(
                paddingCallback,
              )
            : null,
        shadowColor: shadowColorCallback != null
            ? MaterialStateProperty.resolveWith(
                shadowColorCallback,
              )
            : null,
        shape: shapeCallback != null
            ? MaterialStateProperty.resolveWith(
                shapeCallback,
              )
            : null,
        side: sideCallback != null
            ? MaterialStateProperty.resolveWith(
                sideCallback,
              )
            : null,
        tapTargetSize: style.tapTargetSize,
        textStyle: textStyleCallback != null
            ? MaterialStateProperty.resolveWith(
                textStyleCallback,
              )
            : null,
        visualDensity: style.visualDensity,
      ),
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

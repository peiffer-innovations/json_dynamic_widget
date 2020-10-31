import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build a [FloatingActionButton] widget.
/// See the [fromDynamic] for the format.
class JsonFloatingActionButtonBuilder extends JsonWidgetBuilder {
  JsonFloatingActionButtonBuilder({
    this.autofocus,
    this.backgroundColor,
    this.clipBehavior,
    this.disabledElevation,
    this.elevation,
    this.focusColor,
    this.focusElevation,
    this.focusNode,
    this.foregroundColor,
    this.heroTag,
    this.highlightElevation,
    this.hoverColor,
    this.hoverElevation,
    this.isExtended,
    this.materialTapTargetSize,
    this.mini,
    this.mouseCursor,
    this.onPressed,
    this.shape,
    this.splashColor,
    this.tooltip,
  });

  static const type = 'floating_action_button';

  final bool autofocus;
  final Color backgroundColor;
  final Clip clipBehavior;
  final double disabledElevation;
  final double elevation;
  final Color focusColor;
  final double focusElevation;
  final FocusNode focusNode;
  final Color foregroundColor;
  final Object heroTag;
  final double highlightElevation;
  final Color hoverColor;
  final double hoverElevation;
  final bool isExtended;
  final MaterialTapTargetSize materialTapTargetSize;
  final bool mini;
  final MouseCursor mouseCursor;
  final VoidCallback onPressed;
  final ShapeBorder shape;
  final Color splashColor;
  final String tooltip;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "autofocus": <bool>,
  ///   "backgroundColor": <Color>,
  ///   "clipBehavior": <Clip>,
  ///   "disabledElevation": <double>,
  ///   "elevation": <double>,
  ///   "focusColor": <Color>,
  ///   "focusElevation": <double>,
  ///   "focusNode": <FocusNode>,
  ///   "foregroundColor": <Color>,
  ///   "heroTag": <Object>,
  ///   "highlightElevation": <double>,
  ///   "hoverColor": <Color>,
  ///   "hoverElevation": <double>,
  ///   "isExtended": <bool>,
  ///   "materialTapTargetSize": <MaterialTapTargetSize>,
  ///   "mini": <bool>,
  ///   "mouseCursor": <MouseCursor>,
  ///   "onPressed": <VoidCallback>,
  ///   "shape": <ShapeBorder>,
  ///   "splashColor": <Color>,
  ///   "tooltip": <String>
  /// }
  /// ```
  ///
  /// As a note, the [FocusNode], [Object], and [VoidCallback]
  /// cannot be decoded via JSON.  Instead, the only way to bind those values to
  /// the builder is to use a function or a variable reference via the
  /// [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeClip]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeMaterialTapTargetSize]
  ///  * [ThemeDecoder.decodeMouseCursor]
  ///  * [ThemeDecoder.decodeShapeBorder]
  static JsonFloatingActionButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonFloatingActionButtonBuilder result;

    if (map != null) {
      result = JsonFloatingActionButtonBuilder(
        autofocus: JsonClass.parseBool(
              map['autofocus'],
            ) ??
            false,
        backgroundColor: ThemeDecoder.decodeColor(
          map['backgroundColor'],
          validate: false,
        ),
        clipBehavior: ThemeDecoder.decodeClip(
              map['clipBehavior'],
              validate: false,
            ) ??
            Clip.none,
        disabledElevation: JsonClass.parseDouble(
          map['disabledElevation'],
        ),
        elevation: JsonClass.parseDouble(
          map['elevation'],
        ),
        focusColor: ThemeDecoder.decodeColor(
          map['focusColor'],
          validate: false,
        ),
        focusElevation: JsonClass.parseDouble(
          map['focusElevation'],
        ),
        focusNode: map['focusNode'],
        foregroundColor: ThemeDecoder.decodeColor(
          map['foregroundColor'],
          validate: false,
        ),
        heroTag: map['heroTag'] ??
            FloatingActionButton(
              onPressed: null,
            ).heroTag,
        highlightElevation: JsonClass.parseDouble(
          map['highlightElevation'],
        ),
        hoverColor: ThemeDecoder.decodeColor(
          map['hoverColor'],
          validate: false,
        ),
        hoverElevation: JsonClass.parseDouble(
          map['hoverElevation'],
        ),
        isExtended: JsonClass.parseBool(
              map['isExtended'],
            ) ??
            false,
        materialTapTargetSize: ThemeDecoder.decodeMaterialTapTargetSize(
          map['materialTapTargetSize'],
          validate: false,
        ),
        mini: JsonClass.parseBool(map['mini']) ?? false,
        mouseCursor: ThemeDecoder.decodeMouseCursor(
          map['mouseCursor'],
          validate: false,
        ),
        onPressed: map['onPressed'],
        shape: ThemeDecoder.decodeShapeBorder(
          map['shape'],
          validate: false,
        ),
        splashColor: ThemeDecoder.decodeColor(
          map['splashColor'],
          validate: false,
        ),
        tooltip: map['tooltip'],
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
      '[JsonFloatingActionButtonBuilder] only supports exactly one child.',
    );

    return FloatingActionButton(
      autofocus: autofocus,
      backgroundColor: backgroundColor,
      clipBehavior: clipBehavior,
      disabledElevation: disabledElevation,
      elevation: elevation,
      focusColor: focusColor,
      focusElevation: focusElevation,
      focusNode: focusNode,
      foregroundColor: foregroundColor,
      heroTag: heroTag,
      highlightElevation: highlightElevation,
      hoverColor: hoverColor,
      hoverElevation: hoverElevation,
      isExtended: isExtended,
      materialTapTargetSize: materialTapTargetSize,
      mini: mini,
      mouseCursor: mouseCursor,
      onPressed: onPressed,
      shape: shape,
      splashColor: splashColor,
      tooltip: tooltip,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

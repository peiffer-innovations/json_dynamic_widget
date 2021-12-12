import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build a [TextButton] widget.  See the [fromDynamic] for
/// the format.
class JsonTextButtonBuilder extends JsonWidgetBuilder {
  JsonTextButtonBuilder({
    required this.autofocus,
    required this.clipBehavior,
    this.focusNode,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
    this.onPressed,
    this.style,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'text_button';

  final bool autofocus;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final ValueChanged<bool>? onHover;
  final VoidCallback? onLongPress;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "autofocus": <bool>,
  ///   "clipBehavior": <Clip>,
  ///   "focusNode": <FocusNode>,
  ///   "onFocusChange": <ValueChanged<bool>>,
  ///   "onHover": <ValueChanged<bool>>,
  ///   "onLongPress": <VoidCallback>,
  ///   "onPressed": <VoidCallback>,
  ///   "style": <ButtonStyle>
  /// }
  /// ```
  ///
  /// As a note, the [FocusNode], and [VoidCallback] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeButtonStyle]
  ///  * [ThemeDecoder.decodeClip]
  static JsonTextButtonBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonTextButtonBuilder? result;

    if (map != null) {
      result = JsonTextButtonBuilder(
        autofocus: map['autofocus'] == null
            ? false
            : JsonClass.parseBool(
                map['autofocus'],
              ),
        clipBehavior: ThemeDecoder.decodeClip(
              map['clipBehavior'],
              validate: false,
            ) ??
            Clip.none,
        focusNode: map['focusNode'],
        onFocusChange: map['onFocusChange'],
        onHover: map['onHover'],
        onLongPress: map['onLongPress'],
        onPressed: map['onPressed'],
        style: ThemeDecoder.decodeButtonStyle(
          map['style'],
          validate: false,
        ),
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    var child = getChild(data);

    return TextButton(
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      key: key,
      onFocusChange: onFocusChange,
      onHover: onHover,
      onLongPress: onLongPress,
      onPressed: onPressed,
      style: style,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

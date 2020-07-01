import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Radio] widget.  See the [fromDynamic] for the
/// format.
class JsonRadioBuilder extends JsonWidgetBuilder {
  JsonRadioBuilder({
    this.activeColor,
    this.autofocus,
    this.focusColor,
    this.focusNode,
    this.groupValue,
    this.hoverColor,
    this.materialTapTargetSize,
    this.onChanged,
    this.value,
    this.visualDensity,
  });

  static const type = 'radio';

  final Color activeColor;
  final bool autofocus;
  final Color focusColor;
  final FocusNode focusNode;
  final dynamic groupValue;
  final Color hoverColor;
  final MaterialTapTargetSize materialTapTargetSize;
  final ValueChanged<bool> onChanged;
  final dynamic value;
  final VisualDensity visualDensity;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "activeColor": <Color>,
  ///   "autofocus": <bool>,
  ///   "checkColor": <Color>,
  ///   "focusColor": <Color>,
  ///   "focusNode": <dynamic>,
  ///   "focusNode": <FocusNode>,
  ///   "hoverColor": <Color>,
  ///   "materialTapTargetSize": <MaterialTapTargetSize>,
  ///   "onChanged": <ValueCallback<bool>>,
  ///   "tristate": <bool>,
  ///   "value": <dynamic>,
  ///   "visualDensity": <VisualDensity>,
  /// }
  ///
  /// As a note, the [FocusNode] and [ValueCallback<bool>] cannot be decoded via
  /// JSON.  Instead, the only way to bind those values to the builder is to use
  /// a function or a variable reference via the [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeMaterialTapTargetSize]
  ///  * [ThemeDecoder.decodeVisualDensity]
  /// ```
  static JsonRadioBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonRadioBuilder result;

    if (map != null) {
      result = JsonRadioBuilder(
        activeColor: ThemeDecoder.decodeColor(map['activeColor']),
        autofocus: JsonClass.parseBool(map['autofocus']),
        focusColor: ThemeDecoder.decodeColor(map['focusColor']),
        focusNode: map['focusNode'],
        groupValue: map['groupValue'],
        hoverColor: ThemeDecoder.decodeColor(map['hoverColor']),
        materialTapTargetSize: ThemeDecoder.decodeMaterialTapTargetSize(
            map['materialTapTargetSize']),
        onChanged: map['onChanged'],
        value: map['value'] == null ? null : JsonClass.parseBool(map['value']),
        visualDensity: ThemeDecoder.decodeVisualDensity(map['visualDensity']),
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
      data.children?.isNotEmpty == true,
      '[JsonRadioBuilder] does not support children.',
    );

    return Radio<dynamic>(
      activeColor: activeColor,
      autofocus: autofocus,
      focusColor: focusColor,
      focusNode: focusNode,
      groupValue: groupValue,
      hoverColor: hoverColor,
      materialTapTargetSize: materialTapTargetSize,
      onChanged: onChanged,
      value: value,
      visualDensity: visualDensity,
    );
  }
}

import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Checkbox] widget.  See the [fromDynamic] for the
/// format.
class JsonCheckboxBuilder extends JsonWidgetBuilder {
  JsonCheckboxBuilder({
    this.activeColor,
    this.autofocus,
    this.checkColor,
    this.focusColor,
    this.focusNode,
    this.hoverColor,
    this.materialTapTargetSize,
    this.onChanged,
    this.tristate,
    this.value,
    this.visualDensity,
  });

  static const type = 'checkbox';

  final Color activeColor;
  final bool autofocus;
  final Color checkColor;
  final Color focusColor;
  final FocusNode focusNode;
  final Color hoverColor;
  final MaterialTapTargetSize materialTapTargetSize;
  final ValueChanged<bool> onChanged;
  final bool tristate;
  final bool value;
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
  ///   "focusNode": <FocusNode>,
  ///   "hoverColor": <Color>,
  ///   "materialTapTargetSize": <MaterialTapTargetSize>,
  ///   "onChanged": <ValueCallback<bool>>,
  ///   "tristate": <bool>,
  ///   "value": <bool>,
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
  static JsonCheckboxBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonCheckboxBuilder result;

    if (map != null) {
      result = JsonCheckboxBuilder(
        activeColor: ThemeDecoder.decodeColor(map['activeColor']),
        autofocus: JsonClass.parseBool(map['autofocus']),
        checkColor: ThemeDecoder.decodeColor(map['checkColor']),
        focusColor: ThemeDecoder.decodeColor(map['focusColor']),
        focusNode: map['focusNode'],
        hoverColor: ThemeDecoder.decodeColor(map['hoverColor']),
        materialTapTargetSize: ThemeDecoder.decodeMaterialTapTargetSize(
            map['materialTapTargetSize']),
        onChanged: map['onChanged'],
        tristate: JsonClass.parseBool(map['tristate']),
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
      '[JsonCheckboxBuilder] does not support children.',
    );

    return Checkbox(
      activeColor: activeColor,
      autofocus: autofocus,
      checkColor: checkColor,
      focusColor: focusColor,
      focusNode: focusNode,
      hoverColor: hoverColor,
      materialTapTargetSize: materialTapTargetSize,
      onChanged: onChanged,
      tristate: tristate,
      value: value,
      visualDensity: visualDensity,
    );
  }
}

import 'package:child_builder/child_builder.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Switch] widget.  See the [fromDynamic] for the
/// format.
class JsonSwitchBuilder extends JsonWidgetBuilder {
  JsonSwitchBuilder({
    this.activeColor,
    this.activeTrackColor,
    this.autofocus,
    this.autovalidate,
    this.dragStartBehavior,
    this.enabled,
    this.focusColor,
    this.focusNode,
    this.hoverColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.label,
    this.materialTapTargetSize,
    this.onChanged,
    this.trackColor,
    this.validator,
    this.value,
    this.visualDensity,
  });

  static const type = 'switch';

  final Color activeColor;
  final Color activeTrackColor;
  final bool autofocus;
  final bool autovalidate;
  final DragStartBehavior dragStartBehavior;
  final bool enabled;
  final Color focusColor;
  final FocusNode focusNode;
  final Color hoverColor;
  final Color inactiveThumbColor;
  final Color inactiveTrackColor;
  final String label;
  final MaterialTapTargetSize materialTapTargetSize;
  final ValueChanged<bool> onChanged;
  final Color trackColor;
  final Validator validator;
  final bool value;
  final VisualDensity visualDensity;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "activeColor": <Color>,
  ///   "activeTrackColor": <Color>,
  ///   "autofocus": <bool>,
  ///   "autovalidate": <bool>,
  ///   "dragStartBehavior": <DragStartBehavior>,
  ///   "enabled": <bool>,
  ///   "focusColor": <Color>,
  ///   "focusNode": <FocusNode>,
  ///   "hoverColor": <Color>,
  ///   "inactiveThumbColor": <Color>,
  ///   "inactiveTrackColor": <Color>,
  ///   "label": <String>,
  ///   "materialTapTargetSize": <MaterialTapTargetSize>,
  ///   "onChanged": <ValueCallback<bool>>,
  ///   "trackColor": <Color>,
  ///   "validators": <ValueValidator[]>,
  ///   "value": <bool>,
  ///   "visualDensity": <VisualDensity>,
  /// }
  /// ```
  ///
  /// As a note, the [FocusNode] and the [ValueCallback<bool>] cannot be decoded
  /// via JSON.  Instead, the only way to bind those values to the builder is to
  /// use a function or a variable reference via the [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [buildCustom]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeDragStartBehavior]
  ///  * [ThemeDecoder.decodeVisualDensity]
  ///  * [Validator]
  static JsonSwitchBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonSwitchBuilder result;

    if (map != null) {
      result = JsonSwitchBuilder(
        activeColor: ThemeDecoder.decodeColor(
          map['activeColor'],
          validate: false,
        ),
        activeTrackColor: ThemeDecoder.decodeColor(
          map['activeTrackColor'],
          validate: false,
        ),
        autofocus: JsonClass.parseBool(map['autofocus']),
        autovalidate: JsonClass.parseBool(map['autovalidate']),
        dragStartBehavior: ThemeDecoder.decodeDragStartBehavior(
              map['dragStartBehavior'],
              validate: false,
            ) ??
            DragStartBehavior.start,
        enabled:
            map['enabled'] == null ? true : JsonClass.parseBool(map['enabled']),
        focusColor: ThemeDecoder.decodeColor(
          map['focusColor'],
          validate: false,
        ),
        focusNode: map['focusNode'],
        hoverColor: ThemeDecoder.decodeColor(
          map['hoverColor'],
          validate: false,
        ),
        inactiveThumbColor: ThemeDecoder.decodeColor(
          map['inactiveThumbColor'],
          validate: false,
        ),
        inactiveTrackColor: ThemeDecoder.decodeColor(
          map['inactiveTrackColor'],
          validate: false,
        ),
        label: map['label'],
        materialTapTargetSize: ThemeDecoder.decodeMaterialTapTargetSize(
          map['materialTapTargetSize'],
          validate: false,
        ),
        onChanged: map['onChanged'],
        validator: map['validators'] == null
            ? null
            : Validator.fromDynamic({'validators': map['validators']}),
        value: JsonClass.parseBool(map['value']),
        visualDensity: ThemeDecoder.decodeVisualDensity(
          map['visualDensity'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Removes any / all values this builder may have set from the
  /// [JsonWidgetRegistry].
  @override
  void remove(JsonWidgetData data) {
    if (data.id?.isNotEmpty == true) {
      data.registry.removeValue(data.id);
    }

    super.remove(data);
  }

  /// Builds the widget to render to the tree.  If the [data] object has a
  /// non-empty `id` associated with it and the [enabled] property is [true]
  /// then this will attach the selected value to the [JsonWidgetRegistry]
  /// using the `id` as the key any time the selected value is changed.
  ///
  /// Likewise, this will set any error messages using the key '$id.error'.  An
  /// empty string will be used to represent no error message.
  @override
  Widget buildCustom({
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.isNotEmpty != true,
      '[JsonSwitchBuilder] does not support children.',
    );

    return FormField<bool>(
      autovalidate: autovalidate,
      enabled: enabled,
      initialValue: value,
      validator: validator == null
          ? null
          : (value) {
              var error = validator.validate(
                context: context,
                label: label ?? '',
                value: value?.toString(),
              );

              if (data.id?.isNotEmpty == true) {
                data.registry.setValue('${data.id}.error', error ?? '');
              }

              return error;
            },
      builder: (FormFieldState state) => MergeSemantics(
        child: Semantics(
          label: label ?? '',
          child: Switch(
            activeColor: activeColor,
            activeTrackColor: activeTrackColor,
            autofocus: autofocus,
            dragStartBehavior: dragStartBehavior,
            focusColor: focusColor,
            focusNode: focusNode,
            hoverColor: hoverColor,
            inactiveThumbColor: inactiveThumbColor,
            inactiveTrackColor: inactiveTrackColor,
            materialTapTargetSize: materialTapTargetSize,
            onChanged: enabled != true
                ? null
                : (value) {
                    if (onChanged != null) {
                      onChanged(value);
                    }

                    state.didChange(value);

                    if (data.id?.isNotEmpty == true) {
                      data.registry.setValue(data.id, value);
                    }
                  },
            value: state.value,
          ),
        ),
      ),
    );
  }
}

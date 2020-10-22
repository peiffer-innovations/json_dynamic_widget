import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:form_validation/form_validation.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Checkbox] widget.  See the [fromDynamic] for the
/// format.
class JsonCheckboxBuilder extends JsonWidgetBuilder {
  JsonCheckboxBuilder({
    this.activeColor,
    this.autofocus,
    this.autovalidateMode,
    this.checkColor,
    this.enabled,
    this.focusColor,
    this.focusNode,
    this.hoverColor,
    this.label,
    this.materialTapTargetSize,
    this.mouseCursor,
    this.onChanged,
    this.onSaved,
    this.tristate,
    this.validator,
    this.value,
    this.visualDensity,
  });

  static const type = 'checkbox';

  final Color activeColor;
  final bool autofocus;
  final AutovalidateMode autovalidateMode;
  final Color checkColor;
  final bool enabled;
  final Color focusColor;
  final FocusNode focusNode;
  final Color hoverColor;
  final String label;
  final MaterialTapTargetSize materialTapTargetSize;
  final MouseCursor mouseCursor;
  final ValueChanged<bool> onChanged;
  final ValueChanged<bool> onSaved;
  final bool tristate;
  final Validator validator;
  final bool value;
  final VisualDensity visualDensity;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "activeColor": <Color>,
  ///   "autofocus": <bool>,
  ///   "autovalidateMode": <AutovalidateMode>,
  ///   "checkColor": <Color>,
  ///   "enabled": <bool>,
  ///   "focusColor": <Color>,
  ///   "focusNode": <FocusNode>,
  ///   "hoverColor": <Color>,
  ///   "label": <String>,
  ///   "materialTapTargetSize": <MaterialTapTargetSize>,
  ///   "mouseCursor": <MouseCursor>,
  ///   "onChanged": <ValueChanged<bool>>,
  ///   "onSaved": <ValueChanged<onSaved>>,
  ///   "tristate": <bool>,
  ///   "validators": <ValueValidator[]>,
  ///   "value": <bool>,
  ///   "visualDensity": <VisualDensity>,
  /// }
  /// ```
  ///
  /// As a note, the [FocusNode] and [ValueChanged<bool>] cannot be decoded via
  /// JSON.  Instead, the only way to bind those values to the builder is to use
  /// a function or a variable reference via the [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [buildCustom]
  ///  * [ThemeDecoder.decodeAutovalidateMode]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeMaterialTapTargetSize]
  ///  * [ThemeDecoder.decodeMouseCursor]
  ///  * [ThemeDecoder.decodeVisualDensity]
  ///  * [Validator]
  static JsonCheckboxBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonCheckboxBuilder result;

    if (map != null) {
      result = JsonCheckboxBuilder(
        activeColor: ThemeDecoder.decodeColor(
          map['activeColor'],
          validate: false,
        ),
        autofocus: JsonClass.parseBool(map['autofocus']),
        autovalidateMode: map['autovalidate'] == null
            ? ThemeDecoder.decodeAutovalidateMode(map['autovalidateMode'])
            : JsonClass.parseBool(map['autovalidate']) == true
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
        checkColor: ThemeDecoder.decodeColor(
          map['checkColor'],
          validate: false,
        ),
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
        label: map['label'],
        materialTapTargetSize: ThemeDecoder.decodeMaterialTapTargetSize(
          map['materialTapTargetSize'],
          validate: false,
        ),
        mouseCursor: ThemeDecoder.decodeMouseCursor(
          map['mouseCursor'],
          validate: false,
        ),
        onChanged: map['onChanged'],
        onSaved: map['onSaved'],
        tristate: JsonClass.parseBool(map['tristate']),
        validator: map['validators'] == null
            ? null
            : Validator.fromDynamic({'validators': map['validators']}),
        value: map['value'] == null ? null : JsonClass.parseBool(map['value']),
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
      '[JsonCheckboxBuilder] does not support children.',
    );

    var initialValue = value ?? (tristate != true ? false : null);

    return FormField<bool>(
      autovalidateMode: autovalidateMode,
      enabled: enabled,
      initialValue: initialValue,
      onSaved: onSaved,
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
          child: Checkbox(
            activeColor: activeColor,
            autofocus: autofocus,
            checkColor: checkColor,
            focusColor: focusColor,
            focusNode: focusNode,
            hoverColor: hoverColor,
            materialTapTargetSize: materialTapTargetSize,
            mouseCursor: mouseCursor,
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
            tristate: tristate,
            value: state.value,
            visualDensity: visualDensity,
          ),
        ),
      ),
    );
  }
}

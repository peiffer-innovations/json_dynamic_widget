import 'package:child_builder/child_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [CupertinoSwitch] widget.  See the [fromDynamic]
/// for the format.
class JsonCupertinoSwitchBuilder extends JsonWidgetBuilder {
  JsonCupertinoSwitchBuilder({
    this.activeColor,
    this.autovalidate,
    this.dragStartBehavior,
    this.enabled,
    this.label,
    this.onChanged,
    this.trackColor,
    this.validator,
    this.value,
    this.visualDensity,
  });

  static const type = 'cupertino_switch';

  final Color activeColor;
  final bool autovalidate;
  final DragStartBehavior dragStartBehavior;
  final bool enabled;
  final String label;
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
  ///   "autovalidate": <bool>,
  ///   "dragStartBehavior": <DragStartBehavior>,
  ///   "enabled": <bool>,
  ///   "label": <String>,
  ///   "onChanged": <ValueCallback<bool>>,
  ///   "trackColor": <Color>,
  ///   "validators": <ValueValidator[]>,
  ///   "value": <bool>,
  ///   "visualDensity": <VisualDensity>,
  /// }
  /// ```
  ///
  /// As a note, the [ValueCallback<bool>] cannot be decoded via JSON.  Instead,
  /// the only way to bind those values to the builder is to use a function or a
  /// variable reference via the [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [buildCustom]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeDragStartBehavior]
  ///  * [ThemeDecoder.decodeVisualDensity]
  ///  * [Validator]
  static JsonCupertinoSwitchBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonCupertinoSwitchBuilder result;

    if (map != null) {
      result = JsonCupertinoSwitchBuilder(
        activeColor: ThemeDecoder.decodeColor(map['activeColor']),
        autovalidate: JsonClass.parseBool(map['autovalidate']),
        dragStartBehavior:
            ThemeDecoder.decodeDragStartBehavior(map['dragStartBehavior']),
        enabled:
            map['enabled'] == null ? true : JsonClass.parseBool(map['enabled']),
        label: map['label'],
        onChanged: map['onChanged'],
        validator: map['validators'] == null
            ? null
            : Validator.fromDynamic({'validators': map['validators']}),
        value: map['value'] == null ? null : JsonClass.parseBool(map['value']),
        visualDensity: ThemeDecoder.decodeVisualDensity(map['visualDensity']),
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
      '[JsonCupertinoSwitchBuilder] does not support children.',
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
          child: CupertinoSwitch(
            activeColor: activeColor,
            dragStartBehavior: dragStartBehavior ?? DragStartBehavior.start,
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
            trackColor: trackColor,
            value: state.value,
          ),
        ),
      ),
    );
  }
}

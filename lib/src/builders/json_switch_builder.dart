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
    this.activeThumbImage,
    this.activeTrackColor,
    required this.autofocus,
    this.autovalidateMode,
    required this.dragStartBehavior,
    required this.enabled,
    this.focusColor,
    this.focusNode,
    this.hoverColor,
    this.inactiveThumbColor,
    this.inactiveThumbImage,
    this.inactiveTrackColor,
    this.label,
    this.materialTapTargetSize,
    this.mouseCursor,
    this.onActiveThumbImageError,
    this.onChanged,
    this.onInactiveThumbImageError,
    this.onSaved,
    this.overlayColor,
    this.splashRadius,
    this.thumbColor,
    this.trackColor,
    this.validator,
    this.value,
    this.visualDensity,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'switch';

  final Color? activeColor;
  final ImageProvider<Object>? activeThumbImage;
  final Color? activeTrackColor;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final DragStartBehavior dragStartBehavior;
  final bool enabled;
  final Color? focusColor;
  final FocusNode? focusNode;
  final Color? hoverColor;
  final Color? inactiveThumbColor;
  final ImageProvider<Object>? inactiveThumbImage;
  final Color? inactiveTrackColor;
  final String? label;
  final MaterialTapTargetSize? materialTapTargetSize;
  final MouseCursor? mouseCursor;
  final ImageErrorListener? onActiveThumbImageError;
  final ValueChanged<bool>? onChanged;
  final ImageErrorListener? onInactiveThumbImageError;
  final ValueChanged<bool?>? onSaved;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final MaterialStateProperty<Color?>? thumbColor;
  final MaterialStateProperty<Color?>? trackColor;
  final Validator? validator;
  final bool? value;
  final VisualDensity? visualDensity;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "activeColor": <Color>,
  ///   "activeThumbImage": <ImageProvider<Object>>
  ///   "activeTrackColor": <Color>,
  ///   "autofocus": <bool>,
  ///   "autovalidateMode": <AutovalidateMode>,
  ///   "dragStartBehavior": <DragStartBehavior>,
  ///   "enabled": <bool>,
  ///   "focusColor": <Color>,
  ///   "focusNode": <FocusNode>,
  ///   "hoverColor": <Color>,
  ///   "inactiveThumbColor": <Color>,
  ///   "inactiveThumbImage": <ImageProvider<Object>>,
  ///   "inactiveTrackColor": <Color>,
  ///   "label": <String>,
  ///   "materialTapTargetSize": <MaterialTapTargetSize>,
  ///   "mouseCursor": <MouseCursor>,
  ///   "onActiveThumbImageError": <ImageErrorListener>,
  ///   "onChanged": <ValueCallback<bool>>,
  ///   "onInctiveThumbImageError": <ImageErrorListener>,
  ///   "onSaved": <ValueCallback<bool>>,
  ///   "overlayColor": <MaterialStateProperty<Color>>,
  ///   "splashRadius": <double>,
  ///   "thumbColor": <MaterialStateProperty<Color>>,
  ///   "trackColor": <MaterialStateProperty<Color>>,
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
  ///  * [ThemeDecoder.decodeAutovalidateMode]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeDragStartBehavior]
  ///  * [ThemeDecoder.decodeMaterialStatePropertyColor]
  ///  * [ThemeDecoder.decodeMouseCursor]
  ///  * [ThemeDecoder.decodeVisualDensity]
  ///  * [Validator]
  static JsonSwitchBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonSwitchBuilder? result;

    if (map != null) {
      result = JsonSwitchBuilder(
        activeColor: ThemeDecoder.decodeColor(
          map['activeColor'],
          validate: false,
        ),
        activeThumbImage: ThemeDecoder.decodeImageProvider(
          map['activeThumbImage'],
          validate: false,
        ),
        activeTrackColor: ThemeDecoder.decodeColor(
          map['activeTrackColor'],
          validate: false,
        ),
        autofocus: JsonClass.parseBool(map['autofocus']),
        autovalidateMode: map['autovalidate'] == null
            ? ThemeDecoder.decodeAutovalidateMode(map['autovalidateMode'])
            : JsonClass.parseBool(map['autovalidate']) == true
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
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
        inactiveThumbImage: ThemeDecoder.decodeImageProvider(
          map['inactiveThumbImage'],
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
        mouseCursor: ThemeDecoder.decodeMouseCursor(
          map['mouseCursor'],
          validate: false,
        ),
        onActiveThumbImageError: map['onActiveThumbImageError'],
        onChanged: map['onChanged'],
        onInactiveThumbImageError: map['onInactiveThumbImageError'],
        onSaved: map['onSaved'],
        overlayColor: ThemeDecoder.decodeMaterialStatePropertyColor(
          map['overlayColor'],
          validate: false,
        ),
        splashRadius: JsonClass.parseDouble('splashRadius'),
        thumbColor: ThemeDecoder.decodeMaterialStatePropertyColor(
          map['thumbColor'],
          validate: false,
        ),
        trackColor: ThemeDecoder.decodeMaterialStatePropertyColor(
          map['trackColor'],
          validate: false,
        ),
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
    if (data.id.isNotEmpty == true) {
      data.registry.removeValue(
        data.id,
        originator: data.id,
      );
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
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return FormField<bool>(
      autovalidateMode: autovalidateMode,
      enabled: enabled,
      initialValue: value,
      key: key,
      validator: validator == null
          ? null
          : (value) {
              var error = validator!.validate(
                context: context,
                label: label ?? '',
                value: value?.toString(),
              );

              if (data.id.isNotEmpty == true) {
                data.registry.setValue(
                  '${data.id}.error',
                  error ?? '',
                  originator: '${data.id}.error',
                );
              }

              return error;
            },
      onSaved: onSaved,
      builder: (FormFieldState state) => MergeSemantics(
        child: Semantics(
          label: label ?? '',
          child: Switch(
            activeColor: activeColor,
            activeThumbImage: activeThumbImage,
            activeTrackColor: activeTrackColor,
            autofocus: autofocus,
            dragStartBehavior: dragStartBehavior,
            focusColor: focusColor,
            focusNode: focusNode,
            hoverColor: hoverColor,
            inactiveThumbColor: inactiveThumbColor,
            inactiveThumbImage: inactiveThumbImage,
            inactiveTrackColor: inactiveTrackColor,
            materialTapTargetSize: materialTapTargetSize,
            mouseCursor: mouseCursor,
            onActiveThumbImageError: onActiveThumbImageError,
            onChanged: enabled != true
                ? null
                : (value) {
                    if (onChanged != null) {
                      onChanged!(value);
                    }

                    state.didChange(value);

                    if (data.id.isNotEmpty == true) {
                      data.registry.setValue(
                        data.id,
                        value,
                        originator: data.id,
                      );
                    }
                  },
            onInactiveThumbImageError: onInactiveThumbImageError,
            overlayColor: overlayColor,
            splashRadius: splashRadius,
            thumbColor: thumbColor,
            trackColor: trackColor,
            value: state.value,
          ),
        ),
      ),
    );
  }
}

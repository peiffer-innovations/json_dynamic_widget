import 'dart:async';

import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Radio]   See the [fromDynamic] for the
/// format. Unlike other form fields, this requires the `id` for the radio
/// variable to be inside of the `args`.  This is because no two widgets can
/// share the same overall id.
class JsonRadioBuilder extends JsonWidgetBuilder {
  JsonRadioBuilder({
    this.activeColor,
    required this.autofocus,
    this.autovalidateMode,
    required this.enabled,
    this.fillColor,
    this.focusColor,
    this.focusNode,
    this.groupValue,
    this.hoverColor,
    this.id,
    this.label,
    this.materialTapTargetSize,
    this.mouseCursor,
    this.onChanged,
    this.onSaved,
    this.overlayColor,
    this.splashRadius,
    required this.toggleable,
    this.validator,
    this.value,
    this.visualDensity,
  })  : assert(id?.isNotEmpty == true),
        super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'radio';

  final Color? activeColor;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final MaterialStateProperty<Color?>? fillColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final dynamic groupValue;
  final Color? hoverColor;
  final String? id;
  final String? label;
  final MaterialTapTargetSize? materialTapTargetSize;
  final MouseCursor? mouseCursor;
  final ValueChanged<dynamic>? onChanged;
  final ValueChanged<dynamic>? onSaved;
  final MaterialStateProperty<Color?>? overlayColor;
  final bool toggleable;
  final double? splashRadius;
  final Validator? validator;
  final dynamic value;
  final VisualDensity? visualDensity;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "activeColor": <Color>,
  ///   "autovalidateMode": <AutovalidateMode>,
  ///   "autofocus": <bool>,
  ///   "checkColor": <Color>,
  ///   "enabled": <bool>,
  ///   "fillColor": <MaterialStateProperty<Color>>,
  ///   "focusColor": <Color>,
  ///   "focusNode": <FocusNode>,
  ///   "groupValue": <dynamic>,
  ///   "hoverColor": <Color>,
  ///   "id": <String>,
  ///   "label": <String>,
  ///   "materialTapTargetSize": <MaterialTapTargetSize>,
  ///   "mouseCursor": <MouseCursor>,
  ///   "onChanged": <ValueCallback<dynamic>>,
  ///   "onSaved": <ValueCallback<dynamic>>,
  ///   "overlayColor": <MaterialStateProperty<Color>>,
  ///   "toggleable": <bool>,
  ///   "splashRadius": <double>,
  ///   "validators": <ValueValidators[]>,
  ///   "value": <dynamic>,
  ///   "visualDensity": <VisualDensity>,
  /// }
  /// ```
  ///
  /// As a note, the [FocusNode] and [ValueCallback<bool>] cannot be decoded via
  /// JSON.  Instead, the only way to bind those values to the builder is to use
  /// a function or a variable reference via the [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [buildCustom]
  ///  * [ThemeDecoder.decodeAutovalidateMode]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeMaterialTapTargetSize]
  ///  * [ThemeDecoder.decodeVisualDensity]
  ///  * [Validator]
  static JsonRadioBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonRadioBuilder? result;
    if (map != null) {
      result = JsonRadioBuilder(
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
        enabled:
            map['enabled'] == null ? true : JsonClass.parseBool(map['enabled']),
        fillColor: ThemeDecoder.decodeMaterialStatePropertyColor(
          map['fillColor'],
        ),
        focusColor: ThemeDecoder.decodeColor(
          map['focusColor'],
          validate: false,
        ),
        focusNode: map['focusNode'],
        groupValue: map['groupValue'],
        hoverColor: ThemeDecoder.decodeColor(
          map['hoverColor'],
          validate: false,
        ),
        id: map['id'],
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
        overlayColor: ThemeDecoder.decodeMaterialStatePropertyColor(
          map['overlayColor'],
        ),
        splashRadius: JsonClass.parseDouble(map['splashRadius']),
        toggleable: JsonClass.parseBool(map['toggleable']),
        validator: map['validators'] == null
            ? null
            : Validator.fromDynamic({'validators': map['validators']}),
        value: map['value'],
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
    if (id?.isNotEmpty == true) {
      data.registry.removeValue(
        id!,
        originator: id!,
      );
    }

    super.remove(data);
  }

  /// Builds the widget to render to the tree.  If [enabled] property is [true]
  /// then this will attach the selected value to the [JsonWidgetRegistry]
  /// using the `id` as the key any time the selected value is changed.
  ///
  /// Likewise, this will set any error messages using the key '$id.error'.  An
  /// empty string will be used to represent no error message.
  ///
  /// The `id` value must be the same for all radios in the group and each radio
  /// will listen to the [JsonWidgetRegistry] for value updates to be able to
  /// properly select / de-select.
  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    var child = getChild(data);

    return _JsonRadioWidget(
      builder: this,
      childBuilder: childBuilder,
      data: data,
      key: key,
      child: child,
    );
  }
}

class _JsonRadioWidget extends StatefulWidget {
  _JsonRadioWidget({
    required this.builder,
    required this.child,
    required this.childBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonRadioBuilder builder;
  final JsonWidgetData? child;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;

  @override
  _JsonRadioWidgetState createState() => _JsonRadioWidgetState();
}

class _JsonRadioWidgetState extends State<_JsonRadioWidget> {
  final List<StreamSubscription> _subscriptions = [];
  final GlobalKey<FormFieldState> _globalKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();

    _subscriptions.add(
      widget.data.registry.valueStream
          .where((event) =>
              !event.isSelfTriggered && event.id == widget.builder.id)
          .listen(
        (event) {
          if (mounted == true) {
            _globalKey.currentState!.didChange(
              widget.data.registry.getValue(widget.builder.id),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _subscriptions.forEach((sub) => sub.cancel());
    _subscriptions.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<dynamic>(
      autovalidateMode: widget.builder.autovalidateMode,
      enabled: widget.builder.enabled,
      initialValue: widget.builder.groupValue,
      key: _globalKey,
      onSaved: widget.builder.onSaved,
      validator: widget.builder.validator == null
          ? null
          : (value) {
              var error = widget.builder.validator!.validate(
                context: context,
                label: widget.builder.label ?? '',
                value: value?.toString(),
              );

              if (widget.data.id.isNotEmpty == true) {
                widget.data.registry.setValue(
                  '${widget.builder.id}.error',
                  error ?? '',
                  originator: '${widget.builder.id}.error',
                );
              }

              return error;
            },
      builder: (FormFieldState state) => MergeSemantics(
        child: Semantics(
          label: widget.builder.label ?? '',
          child: Radio<dynamic>(
            activeColor: widget.builder.activeColor,
            autofocus: widget.builder.autofocus,
            fillColor: widget.builder.fillColor,
            focusColor: widget.builder.focusColor,
            focusNode: widget.builder.focusNode,
            groupValue: state.value,
            hoverColor: widget.builder.hoverColor,
            materialTapTargetSize: widget.builder.materialTapTargetSize,
            mouseCursor: widget.builder.mouseCursor,
            onChanged: widget.builder.enabled != true
                ? null
                : (value) {
                    if (widget.builder.onChanged != null) {
                      widget.builder.onChanged!(value);
                    }

                    state.didChange(value);

                    if (widget.builder.id?.isNotEmpty == true) {
                      widget.data.registry.setValue(
                        widget.builder.id!,
                        value,
                        originator: widget.builder.id!,
                      );
                    }
                  },
            overlayColor: widget.builder.overlayColor,
            splashRadius: widget.builder.splashRadius,
            toggleable: widget.builder.toggleable,
            value: widget.builder.value,
            visualDensity: widget.builder.visualDensity,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:form_validation/form_validation.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_cupertino_switch_builder.g.dart';

/// Builder that can build an [CupertinoSwitch] widget.
@jsonWidget
abstract class _JsonCupertinoSwitchBuilder extends JsonWidgetBuilder {
  const _JsonCupertinoSwitchBuilder({required super.args});

  @JsonArgDecoder('validators')
  Validator? _decodeValidators({required dynamic value}) =>
      value == null ? null : Validator.fromDynamic({'validators': value});

  @override
  _CupertinoSwitch buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _CupertinoSwitch extends StatefulWidget {
  const _CupertinoSwitch({
    this.activeColor,
    this.autovalidateMode,
    @JsonBuildArg() required this.data,
    this.dragStartBehavior,
    this.enabled = true,
    this.label,
    this.onChanged,
    this.onSaved,
    this.restorationId,
    this.thumbColor,
    this.trackColor,
    this.validators,
    this.value = false,
    this.visualDensity,
  });

  final Color? activeColor;
  final AutovalidateMode? autovalidateMode;
  final JsonWidgetData data;
  final DragStartBehavior? dragStartBehavior;
  final bool enabled;
  final String? label;
  final ValueChanged<bool>? onChanged;
  final ValueChanged<bool?>? onSaved;
  final String? restorationId;
  final Color? thumbColor;
  final Color? trackColor;
  final Validator? validators;
  final bool value;
  final VisualDensity? visualDensity;

  @override
  State createState() => _CupertinoSwitchState();
}

class _CupertinoSwitchState extends State<_CupertinoSwitch> {
  @override
  void dispose() {
    widget.data.jsonWidgetRegistry.removeValue(
      widget.data.jsonWidgetId,
      originator: widget.data.jsonWidgetId,
    );
    super.dispose();
  }

  /// Builds the widget to render to the tree.  If the [data] object has a
  /// non-empty `id` associated with it and the [enabled] property is [true]
  /// then this will attach the selected value to the [JsonWidgetRegistry]
  /// using the `id` as the key any time the selected value is changed.
  ///
  /// Likewise, this will set any error messages using the key '$id.error'.  An
  /// empty string will be used to represent no error message.
  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      autovalidateMode: widget.autovalidateMode,
      enabled: widget.enabled,
      initialValue: widget.value,
      onSaved: widget.onSaved,
      restorationId: widget.restorationId,
      validator:
          widget.validators == null
              ? null
              : (value) {
                final error = widget.validators!.validate(
                  label: widget.label ?? '',
                  value: value?.toString(),
                );

                if (widget.data.jsonWidgetId.isNotEmpty == true) {
                  widget.data.jsonWidgetRegistry.setValue(
                    '${widget.data.jsonWidgetId}.error',
                    error ?? '',
                    originator: widget.data.jsonWidgetId,
                  );
                }

                return error;
              },
      builder:
          (FormFieldState state) => MergeSemantics(
            child: Semantics(
              label: widget.label ?? '',
              child: CupertinoSwitch(
                activeTrackColor: widget.activeColor,
                dragStartBehavior:
                    widget.dragStartBehavior ?? DragStartBehavior.start,
                onChanged:
                    widget.enabled != true
                        ? null
                        : (value) {
                          if (widget.onChanged != null) {
                            widget.onChanged!(value);
                          }

                          state.didChange(value);

                          if (widget.data.jsonWidgetId.isNotEmpty == true) {
                            widget.data.jsonWidgetRegistry.setValue(
                              widget.data.jsonWidgetId,
                              value,
                              originator: widget.data.jsonWidgetId,
                            );
                          }
                        },
                thumbColor: widget.thumbColor,
                inactiveTrackColor: widget.trackColor,
                value: state.value,
              ),
            ),
          ),
    );
  }
}

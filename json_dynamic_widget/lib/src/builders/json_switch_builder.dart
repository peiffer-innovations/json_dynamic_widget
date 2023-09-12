import 'package:flutter/gestures.dart';
import 'package:form_validation/form_validation.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_switch_builder.g.dart';

/// Builder that can build an [Switch] widget.
@jsonWidget
abstract class _JsonSwitchBuilder extends JsonWidgetBuilder {
  const _JsonSwitchBuilder({
    required super.args,
  });

  /// Builds the widget to render to the tree.  If the [data] object has a
  /// non-empty `id` associated with it and the [enabled] property is [true]
  /// then this will attach the selected value to the [JsonWidgetRegistry]
  /// using the `id` as the key any time the selected value is changed.
  ///
  /// Likewise, this will set any error messages using the key '$id.error'.  An
  /// empty string will be used to represent no error message.
  @override
  _Switch buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Switch extends StatefulWidget {
  const _Switch({
    this.activeColor,
    this.activeThumbImage,
    this.activeTrackColor,
    this.autofocus = false,
    this.autovalidateMode,
    @JsonBuildArg() required this.data,
    this.dragStartBehavior = DragStartBehavior.start,
    this.enabled = true,
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
    this.thumbIcon,
    this.trackColor,
    this.validator,
    this.value = false,
    this.visualDensity,
  });

  final Color? activeColor;
  final ImageProvider<Object>? activeThumbImage;
  final Color? activeTrackColor;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final JsonWidgetData data;
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
  final MaterialStateProperty<Icon?>? thumbIcon;
  final MaterialStateProperty<Color?>? trackColor;
  final Validator? validator;
  final bool value;
  final VisualDensity? visualDensity;

  @override
  State<StatefulWidget> createState() => _SwitchState();
}

class _SwitchState extends State<_Switch> {
  @override
  void dispose() {
    if (widget.data.jsonWidgetId.isNotEmpty == true) {
      widget.data.jsonWidgetRegistry.removeValue(
        widget.data.jsonWidgetId,
        originator: widget.data.jsonWidgetId,
      );
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      autovalidateMode: widget.autovalidateMode,
      enabled: widget.enabled,
      initialValue: widget.value,
      key: widget.key,
      validator: widget.validator == null
          ? null
          : (value) {
              final error = widget.validator!.validate(
                label: widget.label ?? '',
                value: value?.toString(),
              );

              if (widget.data.jsonWidgetId.isNotEmpty == true) {
                widget.data.jsonWidgetRegistry.setValue(
                  '${widget.data.jsonWidgetId}.error',
                  error ?? '',
                  originator: '${widget.data.jsonWidgetId}.error',
                );
              }

              return error;
            },
      onSaved: widget.onSaved,
      builder: (FormFieldState state) => MergeSemantics(
        child: Semantics(
          label: widget.label ?? '',
          child: Switch(
            activeColor: widget.activeColor,
            activeThumbImage: widget.activeThumbImage,
            activeTrackColor: widget.activeTrackColor,
            autofocus: widget.autofocus,
            dragStartBehavior: widget.dragStartBehavior,
            focusColor: widget.focusColor,
            focusNode: widget.focusNode,
            hoverColor: widget.hoverColor,
            inactiveThumbColor: widget.inactiveThumbColor,
            inactiveThumbImage: widget.inactiveThumbImage,
            inactiveTrackColor: widget.inactiveTrackColor,
            materialTapTargetSize: widget.materialTapTargetSize,
            mouseCursor: widget.mouseCursor,
            onActiveThumbImageError: widget.onActiveThumbImageError,
            onChanged: widget.enabled != true
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
            onInactiveThumbImageError: widget.onInactiveThumbImageError,
            overlayColor: widget.overlayColor,
            splashRadius: widget.splashRadius,
            thumbColor: widget.thumbColor,
            thumbIcon: widget.thumbIcon,
            trackColor: widget.trackColor,
            value: state.value,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:form_validation/form_validation.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_switch_builder.g.dart';

/// Builder that can build an [Switch] widget.
@jsonWidget
abstract class _JsonSwitchBuilder extends JsonWidgetBuilder {
  const _JsonSwitchBuilder({required super.numSupportedChildren});

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
  _Switch buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Switch extends StatelessWidget {
  const _Switch({
    this.activeColor,
    this.activeThumbImage,
    this.activeTrackColor,
    required this.autofocus,
    this.autovalidateMode,
    @JsonBuilderParam() required this.data,
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
    this.thumbIcon,
    this.trackColor,
    this.validator,
    this.value,
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
  final bool? value;
  final VisualDensity? visualDensity;

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      autovalidateMode: autovalidateMode,
      enabled: enabled,
      initialValue: value,
      key: key,
      validator: validator == null
          ? null
          : (value) {
              final error = validator!.validate(
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
            thumbIcon: thumbIcon,
            trackColor: trackColor,
            value: state.value,
          ),
        ),
      ),
    );
  }
}

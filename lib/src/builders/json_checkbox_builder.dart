import 'package:form_validation/form_validation.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_checkbox_builder.g.dart';

@jsonWidget
abstract class _JsonCheckboxBuilder extends JsonWidgetBuilder {
  const _JsonCheckboxBuilder({
    required super.numSupportedChildren,
  });

  @JsonParamDecoder('validator')
  Validator? _decodeValidator({dynamic value}) => value is Map
      ? Validator.fromDynamic({'validators': value['validators']})
      : null;

  /// Removes any / all values this builder may have set from the
  /// [JsonWidgetRegistry].
  @override
  void remove(JsonWidgetData data) {
    data.registry.removeValue(
      data.id,
      originator: data.id,
    );

    super.remove(data);
  }

  @override
  _Checkbox buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Checkbox extends StatelessWidget {
  const _Checkbox({
    this.activeColor,
    this.autofocus = false,
    this.autovalidateMode,
    this.checkColor,
    @JsonBuilderParam() required this.data,
    this.enabled = true,
    this.fillColor,
    this.focusColor,
    this.focusNode,
    this.hoverColor,
    this.isError = false,
    this.label,
    this.materialTapTargetSize,
    this.mouseCursor,
    this.onChanged,
    this.onSaved,
    this.overlayColor,
    this.shape,
    this.side,
    this.splashRadius,
    this.tristate = false,
    this.validator,
    this.value,
    this.visualDensity,
  });

  final Color? activeColor;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final Color? checkColor;
  final JsonWidgetData data;
  final bool enabled;
  final MaterialStateProperty<Color?>? fillColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final Color? hoverColor;
  final bool isError;
  final String? label;
  final MaterialTapTargetSize? materialTapTargetSize;
  final MouseCursor? mouseCursor;
  final ValueChanged<bool?>? onChanged;
  final ValueChanged<bool?>? onSaved;
  final MaterialStateProperty<Color?>? overlayColor;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final double? splashRadius;
  final bool tristate;
  final Validator? validator;
  final bool? value;
  final VisualDensity? visualDensity;

  /// Builds the widget to render to the tree.  If the [data] object has a
  /// non-empty `id` associated with it and the [enabled] property is [true]
  /// then this will attach the selected value to the [JsonWidgetRegistry]
  /// using the `id` as the key any time the selected value is changed.
  ///
  /// Likewise, this will set any error messages using the key '$id.error'.  An
  /// empty string will be used to represent no error message.
  @override
  Widget build(BuildContext context) {
    final initialValue = value ?? (tristate != true ? false : null);

    return FormField<bool>(
      autovalidateMode: autovalidateMode,
      enabled: enabled,
      initialValue: initialValue,
      onSaved: onSaved,
      validator: validator == null
          ? null
          : (value) {
              final error = validator!.validate(
                label: label ?? '',
                value: value?.toString(),
              );

              data.registry.setValue(
                '${data.id}.error',
                error ?? '',
                originator: data.id,
              );

              return error;
            },
      builder: (FormFieldState state) => MergeSemantics(
        child: Semantics(
          label: label ?? '',
          child: Checkbox(
            activeColor: activeColor,
            autofocus: autofocus,
            checkColor: checkColor,
            fillColor: fillColor,
            focusColor: focusColor,
            focusNode: focusNode,
            hoverColor: hoverColor,
            isError: isError,
            key: key,
            materialTapTargetSize: materialTapTargetSize,
            mouseCursor: mouseCursor,
            onChanged: enabled != true
                ? null
                : (value) {
                    if (onChanged != null) {
                      onChanged!(value);
                    }

                    state.didChange(value);

                    data.registry.setValue(
                      data.id,
                      value,
                      originator: data.id,
                    );
                  },
            overlayColor: overlayColor,
            shape: shape,
            side: side,
            splashRadius: splashRadius,
            tristate: tristate,
            value: state.value,
            visualDensity: visualDensity,
          ),
        ),
      ),
    );
  }
}

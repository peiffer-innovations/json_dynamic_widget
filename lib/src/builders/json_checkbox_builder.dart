import 'package:form_validation/form_validation.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_checkbox_builder.g.dart';

@jsonWidget
abstract class _JsonCheckboxBuilder extends JsonWidgetBuilder {
  const _JsonCheckboxBuilder();

  @JsonArgDecoder('validator')
  Validator? _decodeValidator({dynamic value}) => value is Map
      ? Validator.fromDynamic({'validators': value['validators']})
      : null;

  @override
  _Checkbox buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Checkbox extends StatefulWidget {
  const _Checkbox({
    this.activeColor,
    this.autofocus = false,
    this.autovalidateMode,
    this.checkColor,
    @JsonBuildArg() required this.data,
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

  @override
  State createState() => _CheckboxState();
}

class _CheckboxState extends State<_Checkbox> {
  @override
  void dispose() {
    widget.data.registry.removeValue(
      widget.data.id,
      originator: widget.data.id,
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
    final initialValue =
        widget.value ?? (widget.tristate != true ? false : null);

    return FormField<bool>(
      autovalidateMode: widget.autovalidateMode,
      enabled: widget.enabled,
      initialValue: initialValue,
      onSaved: widget.onSaved,
      validator: widget.validator == null
          ? null
          : (value) {
              final error = widget.validator!.validate(
                label: widget.label ?? '',
                value: value?.toString(),
              );

              widget.data.registry.setValue(
                '${widget.data.id}.error',
                error ?? '',
                originator: widget.data.id,
              );

              return error;
            },
      builder: (FormFieldState state) => MergeSemantics(
        child: Semantics(
          label: widget.label ?? '',
          child: Checkbox(
            activeColor: widget.activeColor,
            autofocus: widget.autofocus,
            checkColor: widget.checkColor,
            fillColor: widget.fillColor,
            focusColor: widget.focusColor,
            focusNode: widget.focusNode,
            hoverColor: widget.hoverColor,
            isError: widget.isError,
            materialTapTargetSize: widget.materialTapTargetSize,
            mouseCursor: widget.mouseCursor,
            onChanged: widget.enabled != true
                ? null
                : (value) {
                    if (widget.onChanged != null) {
                      widget.onChanged!(value);
                    }

                    state.didChange(value);

                    widget.data.registry.setValue(
                      widget.data.id,
                      value,
                      originator: widget.data.id,
                    );
                  },
            overlayColor: widget.overlayColor,
            shape: widget.shape,
            side: widget.side,
            splashRadius: widget.splashRadius,
            tristate: widget.tristate,
            value: state.value,
            visualDensity: widget.visualDensity,
          ),
        ),
      ),
    );
  }
}

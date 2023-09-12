import 'dart:async';

import 'package:form_validation/form_validation.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_radio_builder.g.dart';

/// Builder that can build an [Radio]  Unlike other form fields, this requires
/// the `id` for the radio variable to be inside of the `args`.  This is because
/// no two widgets can share the same overall id.
@jsonWidget
abstract class _JsonRadioBuilder extends JsonWidgetBuilder {
  const _JsonRadioBuilder({
    required super.args,
  });

  @override
  _Radio buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Radio extends StatefulWidget {
  _Radio({
    this.activeColor,
    required this.autofocus,
    this.autovalidateMode,
    @JsonBuildArg() required this.data,
    this.enabled = true,
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
  }) : assert(id?.isNotEmpty == true);

  final Color? activeColor;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final JsonWidgetData data;
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

  @override
  State createState() => _RadioState();
}

class _RadioState extends State<_Radio> {
  final List<StreamSubscription> _subscriptions = [];
  final GlobalKey<FormFieldState> _globalKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();

    _subscriptions.add(
      widget.data.jsonWidgetRegistry.valueStream
          .where((event) => event.id == widget.id)
          .listen(
        (event) {
          if (mounted == true) {
            _globalKey.currentState!.didChange(
              widget.data.jsonWidgetRegistry.getValue(widget.id),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    final id = widget.data.jsonWidgetArgs?['id']?.toString();

    if (id != null && id.isNotEmpty == true) {
      widget.data.jsonWidgetRegistry.removeValue(
        id,
        originator: id,
      );
    }
    for (var sub in _subscriptions) {
      sub.cancel();
    }
    _subscriptions.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<dynamic>(
      autovalidateMode: widget.autovalidateMode,
      enabled: widget.enabled,
      initialValue: widget.groupValue,
      key: _globalKey,
      onSaved: widget.onSaved,
      validator: widget.validator == null
          ? null
          : (value) {
              final error = widget.validator!.validate(
                label: widget.label ?? '',
                value: value?.toString(),
              );

              if (widget.data.jsonWidgetId.isNotEmpty == true) {
                widget.data.jsonWidgetRegistry.setValue(
                  '${widget.id}.error',
                  error ?? '',
                  originator: '${widget.id}.error',
                );
              }

              return error;
            },
      builder: (FormFieldState state) => MergeSemantics(
        child: Semantics(
          label: widget.label ?? '',
          child: Radio<dynamic>(
            activeColor: widget.activeColor,
            autofocus: widget.autofocus,
            fillColor: widget.fillColor,
            focusColor: widget.focusColor,
            focusNode: widget.focusNode,
            groupValue: state.value,
            hoverColor: widget.hoverColor,
            materialTapTargetSize: widget.materialTapTargetSize,
            mouseCursor: widget.mouseCursor,
            onChanged: widget.enabled != true
                ? null
                : (value) {
                    if (widget.onChanged != null) {
                      widget.onChanged!(value);
                    }

                    state.didChange(value);

                    if (widget.id?.isNotEmpty == true) {
                      widget.data.jsonWidgetRegistry.setValue(
                        widget.id!,
                        value,
                        originator: widget.id!,
                      );
                    }
                  },
            overlayColor: widget.overlayColor,
            splashRadius: widget.splashRadius,
            toggleable: widget.toggleable,
            value: widget.value,
            visualDensity: widget.visualDensity,
          ),
        ),
      ),
    );
  }
}

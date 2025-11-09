import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_radio_group_builder.g.dart';

/// Builder that can build an [RadioGroup] widget.
@JsonWidget(requiresId: true)
abstract class _JsonRadioGroupBuilder extends JsonWidgetBuilder {
  const _JsonRadioGroupBuilder({required super.args});

  @override
  _RadioGroup buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _RadioGroup extends StatefulWidget {
  const _RadioGroup({
    @JsonBuildArg() this.childBuilder,
    @JsonBuildArg() required this.data,
    required this.groupValue,
    required this.onChanged,
    this.child,
  });

  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData? child;
  final JsonWidgetData data;
  final dynamic groupValue;
  final ValueChanged<dynamic>? onChanged;

  @override
  State createState() => _RadioGroupState();
}

class _RadioGroupState extends State<_RadioGroup> {
  dynamic _groupValue;

  @override
  void initState() {
    super.initState();
    _groupValue = widget.groupValue;

    widget.data.jsonWidgetRegistry.setValue(
      widget.data.jsonWidgetId,
      _groupValue,
      originator: widget.data.jsonWidgetId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RadioGroup<dynamic>(
      groupValue: widget.data.jsonWidgetRegistry.getValue(
        widget.data.jsonWidgetId,
      ),
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
        _groupValue = value;
        widget.data.jsonWidgetRegistry.setValue(
          widget.data.jsonWidgetId,
          value,
          originator: widget.data.jsonWidgetId,
        );
        if (mounted) {
          setState(() {});
        }
      },

      child:
          widget.child?.build(
            childBuilder: widget.childBuilder,
            context: context,
            registry: widget.data.jsonWidgetRegistry,
          ) ??
          const SizedBox(),
    );
  }
}

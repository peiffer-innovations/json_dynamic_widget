import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_form_builder.g.dart';

/// Builder that can build an [Form] widget.
@jsonWidget
abstract class _JsonFormBuilder extends JsonWidgetBuilder {
  const _JsonFormBuilder({
    required super.args,
  });

  /// If the `id` on the [data] object is non-empty, this will ensure a
  /// [GlobalKey<FormState>] is placed on the [JsonWidgetRegistry] using the
  /// key: "${data.jsonWidgetId}.key" so that handler functions can access the form's
  /// state.
  @override
  _Form buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Form extends StatefulWidget {
  const _Form({
    this.autovalidateMode,
    required this.child,
    @JsonBuildArg() required this.childBuilder,
    @JsonBuildArg() required this.data,
    super.key,
    this.onChanged,
    this.onWillPop,
  });

  final AutovalidateMode? autovalidateMode;
  final Widget? child;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;
  final VoidCallback? onChanged;
  final WillPopCallback? onWillPop;

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<_Form> {
  GlobalKey<FormState>? _key;

  @override
  void initState() {
    super.initState();

    _key = GlobalKey<FormState>();
    widget.data.jsonWidgetRegistry.setValue(
      '${widget.data.jsonWidgetId}.key',
      _key,
      originator: '${widget.data.jsonWidgetId}.key',
    );
  }

  @override
  void dispose() {
    super.dispose();

    widget.data.jsonWidgetRegistry.removeValue(
      '${widget.data.jsonWidgetId}.key',
      originator: '${widget.data.jsonWidgetId}.key',
    );
  }

  @override
  Widget build(BuildContext context) => Form(
        autovalidateMode: widget.autovalidateMode,
        key: _key,
        onChanged: widget.onChanged,
        onWillPop: widget.onWillPop,
        child: widget.child ?? const SizedBox(),
      );
}

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_form_builder.g.dart';

/// Builder that can build an [Form] widget.
@jsonWidget
abstract class _JsonFormBuilder extends JsonWidgetBuilder {
  const _JsonFormBuilder({
    required super.numSupportedChildren,
  });

  /// If the `id` on the [data] object is non-empty, this will ensure a
  /// [GlobalKey<FormState>] is placed on the [JsonWidgetRegistry] using the
  /// key: "${data.id}.key" so that handler functions can access the form's
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
    @JsonBuilderParam() required this.childBuilder,
    @JsonBuilderParam() required this.data,
    Key? key,
    this.onChanged,
    this.onWillPop,
  }) : super(key: key);

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
    widget.data.registry.setValue(
      '${widget.data.id}.key',
      _key,
      originator: '${widget.data.id}.key',
    );
  }

  @override
  void dispose() {
    super.dispose();

    widget.data.registry.removeValue(
      '${widget.data.id}.key',
      originator: '${widget.data.id}.key',
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

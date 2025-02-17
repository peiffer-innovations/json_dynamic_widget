import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_set_scroll_controller_builder.g.dart';

/// Builder that creates a scroll controller and then sets it as a variable
/// using the "key" name.
@jsonWidget
abstract class _JsonSetScrollControllerBuilder extends JsonWidgetBuilder {
  const _JsonSetScrollControllerBuilder({required super.args});

  @override
  @JsonArgAlias(alias: 'key', name: 'varName')
  _SetScrollController buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _SetScrollController extends StatefulWidget {
  const _SetScrollController({
    this.child,
    required this.childBuilder,
    @JsonBuildArg() required this.data,
    this.debugLabel,
    this.initialScrollOffset,
    super.key,
    required this.keepScrollOffset,
    this.varName = 'scrollController',
  });

  final JsonWidgetData? child;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;
  final String? debugLabel;
  final double? initialScrollOffset;
  final bool keepScrollOffset;
  final String varName;

  @override
  State createState() => _JsonSetScrollControllerWidgetState();
}

class _JsonSetScrollControllerWidgetState extends State<_SetScrollController> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController(
      debugLabel: widget.debugLabel,
      initialScrollOffset: widget.initialScrollOffset ?? 0,
      keepScrollOffset: widget.keepScrollOffset,
    );

    widget.data.jsonWidgetRegistry.setValue(
      widget.varName,
      _controller,
      originator: null,
    );
    // widget.data.children?.forEach((e) => e.recreate());
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.data.jsonWidgetRegistry.removeValue(
      widget.varName,
      originator: null,
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Builder(
    builder: (BuildContext context) {
      return widget.child?.build(
            childBuilder: widget.childBuilder,
            context: context,
            registry: widget.data.jsonWidgetRegistry,
          ) ??
          const SizedBox();
    },
  );
}

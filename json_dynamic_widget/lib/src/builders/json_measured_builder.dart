import 'package:flutter/scheduler.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_measured_builder.g.dart';

/// Builder that can build a widget that measures itself and writes the
/// measurements to the [JsonWidgetRegistry]'s values.
@jsonWidget
abstract class _JsonMeasuredBuilder extends JsonWidgetBuilder {
  const _JsonMeasuredBuilder({
    required super.args,
  });

  @override
  _Measured buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Measured extends StatefulWidget {
  const _Measured({
    @JsonBuildArg() required this.childBuilder,
    this.child,
    @JsonBuildArg() required this.data,
    Key? key,
  }) : super(key: key);

  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData? child;
  final JsonWidgetData data;

  @override
  _MeasuredState createState() => _MeasuredState();
}

class _MeasuredState extends State<_Measured> {
  final GlobalKey _renderKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final boundary =
          _renderKey.currentContext!.findRenderObject() as RenderBox?;

      if (boundary != null && boundary.hasSize == true) {
        widget.data.jsonWidgetRegistry.setValue(
          '${widget.data.jsonWidgetId}.height',
          boundary.size.height,
          originator: '${widget.data.jsonWidgetId}.height',
        );
        widget.data.jsonWidgetRegistry.setValue(
          '${widget.data.jsonWidgetId}.width',
          boundary.size.width,
          originator: '${widget.data.jsonWidgetId}.width',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
        key: _renderKey,
        child: widget.child?.build(
              childBuilder: widget.childBuilder,
              context: context,
              registry: widget.data.jsonWidgetRegistry,
            ) ??
            const SizedBox(),
      );
}

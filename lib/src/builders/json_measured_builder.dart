import 'package:flutter/scheduler.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_measured_builder.g.dart';

/// Builder that can build a widget that measures itself and writes the
/// measurements to the [JsonWidgetRegistry]'s values.
@jsonWidget
abstract class _JsonMeasuredBuilder extends JsonWidgetBuilder {
  const _JsonMeasuredBuilder({required super.numSupportedChildren});

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
    @JsonBuilderParam() required this.childBuilder,
    @JsonBuilderParam() required this.data,
    Key? key,
  }) : super(key: key);

  final ChildWidgetBuilder? childBuilder;
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
        widget.data.registry.setValue(
          '${widget.data.id}.height',
          boundary.size.height,
          originator: '${widget.data.id}.height',
        );
        widget.data.registry.setValue(
          '${widget.data.id}.width',
          boundary.size.width,
          originator: '${widget.data.id}.width',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
        key: _renderKey,
        child: widget.data.children?.length != 1
            ? const SizedBox()
            : widget.data.children![0].build(
                childBuilder: widget.childBuilder,
                context: context,
              ),
      );
}

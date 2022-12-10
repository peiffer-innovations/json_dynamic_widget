import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build a widget that measures itself and writes the
/// measurements to the [JsonWidgetRegistry]'s values.  See the [fromDynamic]
/// for the format.
class JsonMeasuredBuilder extends JsonWidgetBuilder {
  JsonMeasuredBuilder() : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'measured';

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  /// }
  /// ```
  static JsonMeasuredBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonMeasuredBuilder? result;
    if (map != null) {
      result = JsonMeasuredBuilder();
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) =>
      _Measured(
        builder: this,
        childBuilder: childBuilder,
        data: data,
        key: key,
      );
}

class _Measured extends StatefulWidget {
  _Measured({
    required this.builder,
    required this.childBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonMeasuredBuilder builder;
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
      var boundary =
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
            ? SizedBox()
            : widget.data.children![0].build(
                childBuilder: widget.childBuilder,
                context: context,
              ),
      );
}

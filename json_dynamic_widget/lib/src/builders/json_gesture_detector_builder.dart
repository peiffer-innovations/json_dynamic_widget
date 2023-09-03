// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_gesture_detector_builder.g.dart';

/// Builder that can build an [GestureDetector] widget.
@jsonWidget
abstract class _JsonGestureDetectorBuilder extends JsonWidgetBuilder {
  const _JsonGestureDetectorBuilder({
    required super.args,
  });

  @override
  GestureDetector buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

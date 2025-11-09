// ignore: unused_import
import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_scaffold_builder.g.dart';

const double _kBottomSheetDominatesPercentage = 0.3;
const double _kMinBottomSheetScrimOpacity = 0.1;
const double _kMaxBottomSheetScrimOpacity = 0.6;

/// Builder that can build an [Scaffold] widget.
@jsonWidget
abstract class _JsonScaffoldBuilder extends JsonWidgetBuilder {
  const _JsonScaffoldBuilder({required super.args});

  @override
  Scaffold buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

Widget _defaultBottomSheetScrimBuilder(
  BuildContext context,
  Animation<double> animation,
) {
  return AnimatedBuilder(
    animation: animation,
    builder: (BuildContext context, Widget? child) {
      final extentRemaining =
          _kBottomSheetDominatesPercentage * (1.0 - animation.value);
      final floatingButtonVisibilityValue =
          extentRemaining * _kBottomSheetDominatesPercentage * 10;

      final double opacity = math.max(
        _kMinBottomSheetScrimOpacity,
        _kMaxBottomSheetScrimOpacity - floatingButtonVisibilityValue,
      );

      return ModalBarrier(
        dismissible: false,
        color: Colors.black.withValues(alpha: opacity),
      );
    },
  );
}

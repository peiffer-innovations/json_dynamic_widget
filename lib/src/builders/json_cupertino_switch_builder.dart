import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_cupertino_switch_builder.g.dart';

/// Builder that can build an [CupertinoSwitch] widget.
@jsonWidget
abstract class _JsonCupertinoSwitchBuilder extends JsonWidgetBuilder {
  const _JsonCupertinoSwitchBuilder({
    required super.numSupportedChildren,
  });

  @override
  CupertinoSwitch buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

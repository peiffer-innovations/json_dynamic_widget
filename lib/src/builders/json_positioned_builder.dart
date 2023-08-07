import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_positioned_builder.g.dart';

/// Builder that can build an [Positioned] widget.
@jsonWidget
abstract class _JsonPositionedBuilder extends JsonWidgetBuilder {
  const _JsonPositionedBuilder({
    required super.numSupportedChildren,
  });

  @override
  Positioned buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

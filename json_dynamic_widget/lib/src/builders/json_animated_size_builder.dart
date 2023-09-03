import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_animated_size_builder.g.dart';

/// Builder that can build an [AnimatedSize] widget.
@jsonWidget
abstract class _JsonAnimatedSizeBuilder extends JsonWidgetBuilder {
  const _JsonAnimatedSizeBuilder({
    required super.args,
  });

  @override
  AnimatedSize buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

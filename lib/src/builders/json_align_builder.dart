import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_align_builder.g.dart';

/// Builder that can build an [Align] widget.
@jsonWidget
abstract class _JsonAlignBuilder extends JsonWidgetBuilder {
  const _JsonAlignBuilder({
    required super.numSupportedChildren,
  });

  @override
  Align buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

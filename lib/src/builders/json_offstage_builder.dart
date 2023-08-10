import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_offstage_builder.g.dart';

/// Builder that can build an [Offstage] widget.
@jsonWidget
abstract class _JsonOffstageBuilder extends JsonWidgetBuilder {
  const _JsonOffstageBuilder();

  @override
  Offstage buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

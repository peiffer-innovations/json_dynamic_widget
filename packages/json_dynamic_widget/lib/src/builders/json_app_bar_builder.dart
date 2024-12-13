import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_app_bar_builder.g.dart';

/// Builder that can build an [AppBar] widget.
@jsonWidget
abstract class _JsonAppBarBuilder extends JsonWidgetBuilder {
  const _JsonAppBarBuilder({
    required super.args,
  }) : super(preferredSizeWidget: true);

  @override
  AppBar buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

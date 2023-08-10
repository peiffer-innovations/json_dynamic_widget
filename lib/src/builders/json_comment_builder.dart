import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_comment_builder.g.dart';

/// Builder is just a placeholder to allow for placing comments in the JSON
/// tree for human readability.
@jsonWidget
abstract class _JsonCommentBuilder extends JsonWidgetBuilder {
  const _JsonCommentBuilder();

  @override
  _Comment buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Comment extends StatelessWidget {
  const _Comment({
    this.child,
    super.key,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) => child ?? const SizedBox();
}

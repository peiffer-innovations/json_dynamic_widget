import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_comment_builder.g.dart';

/// Builder is just a placeholder to allow for placing comments in the JSON
/// tree for human readability.
@jsonWidget
abstract class _JsonCommentBuilder extends JsonWidgetBuilder {
  const _JsonCommentBuilder({required super.args});

  @override
  _Comment buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Comment extends StatelessWidget {
  const _Comment({this.child, this.comment, this.comments, super.key});

  final Widget? child;

  /// Never used.  Only exists to allow the schema validation to pass.
  final String? comment;

  /// Never used.  Only exists to allow the schema validation to pass.
  final List? comments;

  @override
  Widget build(BuildContext context) => child ?? const SizedBox();
}

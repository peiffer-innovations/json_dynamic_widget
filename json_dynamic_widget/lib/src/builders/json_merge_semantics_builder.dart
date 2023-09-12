import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_merge_semantics_builder.g.dart';

/// Builder that can build an [MergeSemantics] widget.
@jsonWidget
abstract class _JsonMergeSemanticsBuilder extends JsonWidgetBuilder {
  const _JsonMergeSemanticsBuilder({
    required super.args,
  });

  @override
  MergeSemantics buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

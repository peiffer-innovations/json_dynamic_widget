import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_exclude_semantics_builder.g.dart';

/// Builder that can build an [ExcludeSemantics] widget.
@jsonWidget
abstract class _JsonExcludeSemanticsBuilder extends JsonWidgetBuilder {
  const _JsonExcludeSemanticsBuilder({required super.args});

  @override
  ExcludeSemantics buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

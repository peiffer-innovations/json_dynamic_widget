import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_wrap_builder.g.dart';

/// Builder that can build an [Wrap] widget.
@jsonWidget
abstract class _JsonWrapBuilder extends JsonWidgetBuilder {
  const _JsonWrapBuilder();

  @override
  _Wrap buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Wrap extends StatelessWidget {
  const _Wrap({
    this.alignment,
    @JsonBuildArg() required this.childBuilder,
    this.children,
    this.clipBehavior,
    this.crossAxisAlignment,
    @JsonBuildArg() required this.data,
    this.direction,
    this.runAlignment,
    this.runSpacing,
    this.spacing,
    super.key,
    this.textDirection,
    this.verticalDirection,
  });

  final WrapAlignment? alignment;
  final ChildWidgetBuilder? childBuilder;
  final List<JsonWidgetData>? children;
  final Clip? clipBehavior;
  final WrapCrossAlignment? crossAxisAlignment;
  final JsonWidgetData data;
  final Axis? direction;
  final WrapAlignment? runAlignment;
  final double? runSpacing;
  final double? spacing;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;

  @override
  Widget build(BuildContext context) => Wrap(
        alignment: alignment ?? WrapAlignment.start,
        clipBehavior: clipBehavior ?? Clip.none,
        crossAxisAlignment: crossAxisAlignment ?? WrapCrossAlignment.start,
        direction: direction ?? Axis.horizontal,
        key: key,
        runAlignment: runAlignment ?? WrapAlignment.start,
        runSpacing: runSpacing ?? 0.0,
        spacing: spacing ?? 0.0,
        textDirection: textDirection,
        verticalDirection: verticalDirection ?? VerticalDirection.down,
        children: [
          for (var child in children ?? <JsonWidgetData>[])
            child.build(
              context: context,
              childBuilder: childBuilder,
              registry: data.registry,
            ),
        ],
      );
}

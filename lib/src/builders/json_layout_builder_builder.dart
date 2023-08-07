import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_layout_builder_builder.g.dart';

/// Builder that can build an [LayoutBuilder] widget.
@jsonWidget
abstract class _JsonLayoutBuilderBuilder extends JsonWidgetBuilder {
  const _JsonLayoutBuilderBuilder({
    required super.numSupportedChildren,
  });

  @JsonParamDecoder('builder')
  dynamic _decodeBuilder({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
    required dynamic value,
  }) =>
      (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        final id = data.id;

        data.registry.setValue(
          '$id.maxHeight',
          constraints.maxHeight,
          originator: '$id.maxHeight',
        );
        data.registry.setValue(
          '$id.maxWidth',
          constraints.maxWidth,
          originator: '$id.maxWidth',
        );
        data.registry.setValue(
          '$id.minHeight',
          constraints.minHeight,
          originator: '$id.minHeight',
        );
        data.registry.setValue(
          '$id.minWidth',
          constraints.minWidth,
          originator: '$id.minWidth',
        );

        final child = getChild(data);

        return data.children?.length != 1
            ? const SizedBox()
            : child.build(
                childBuilder: childBuilder,
                context: context,
              );
      };

  @override
  LayoutBuilder buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

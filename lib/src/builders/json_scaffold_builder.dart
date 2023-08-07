// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_scaffold_builder.g.dart';

/// Builder that can build an [Scaffold] widget.
@jsonWidget
abstract class _JsonScaffoldBuilder extends JsonWidgetBuilder {
  const _JsonScaffoldBuilder({
    super.numSupportedChildren = NumSupportedChildren.one,
  });

  @JsonParamDecoder('body')
  Widget? _decodeBody({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    required JsonWidgetData? value,
  }) =>
      (value ?? getChild(data)).build(
        childBuilder: childBuilder,
        context: context,
      );

  @override
  Scaffold buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

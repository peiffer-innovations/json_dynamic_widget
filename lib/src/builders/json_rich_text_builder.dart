// ignore: unused_import
import 'package:flutter/rendering.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_rich_text_builder.g.dart';

/// Builder that can build an [RichText] widget.
@jsonWidget
abstract class _JsonRichTextBuilder extends JsonWidgetBuilder {
  const _JsonRichTextBuilder();

  @override
  RichText buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

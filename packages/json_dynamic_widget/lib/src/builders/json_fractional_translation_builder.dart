import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_fractional_translation_builder.g.dart';

/// Builder that can build an [FractionalTranslation] widget.
@jsonWidget
abstract class _JsonFractionalTranslationBuilder extends JsonWidgetBuilder {
  const _JsonFractionalTranslationBuilder({required super.args});

  @override
  FractionalTranslation buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

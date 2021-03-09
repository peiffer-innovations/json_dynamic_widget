import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build a [FractionalTranslation] widget.  See the [fromDynamic] for the
/// format.
class JsonFractionalTranslationBuilder extends JsonWidgetBuilder {
  JsonFractionalTranslationBuilder({
    required this.transformHitTests,
    required this.translation,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'fractional_translation';

  final bool transformHitTests;
  final Offset translation;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "transformHitTests": <bool>,
  ///   "translation": <Offset>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeOffset]
  static JsonFractionalTranslationBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonFractionalTranslationBuilder? result;

    if (map != null) {
      result = JsonFractionalTranslationBuilder(
        transformHitTests: map['transformHitTests'] == null
            ? true
            : JsonClass.parseBool(
                map['transformHitTests'],
              ),
        translation: ThemeDecoder.decodeOffset(
          map['translation'],
          validate: false,
        )!,
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    var child = getChild(data);

    return FractionalTranslation(
      key: key,
      transformHitTests: transformHitTests,
      translation: translation,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [Offstage] widget.  See the [fromDynamic] for the
/// format.
class JsonOffstageBuilder extends JsonWidgetBuilder {
  const JsonOffstageBuilder({
    required this.offstage,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'offstage';

  final bool offstage;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "offstage": "<bool>"
  /// }
  /// ```
  static JsonOffstageBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonOffstageBuilder? result;

    if (map != null) {
      result = JsonOffstageBuilder(
        offstage: JsonClass.parseBool(
          map['offstage'],
          whenNull: true,
        ),
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
    final child = getChild(data);

    return Offstage(
      key: key,
      offstage: offstage,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

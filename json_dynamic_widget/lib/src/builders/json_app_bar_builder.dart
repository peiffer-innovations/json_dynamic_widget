import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_app_bar_builder.g.dart';

/// Builder that can build an [AppBar] widget.
@jsonWidget
abstract class _JsonAppBarBuilder extends JsonWidgetBuilder {
  const _JsonAppBarBuilder({
    required super.args,
  }) : super(preferredSizeWidget: true);

  // @JsonArgEncoder('notificationPredicate')
  // static String? _encodeNotificationPredicate(
  //   bool Function(ScrollNotification) value,
  // ) =>
  //     null; // A function cannot be encoded ever.

  // @JsonArgDecoder('notificationPredicate')
  // bool Function(ScrollNotification) _decodeNotificationPredicate({
  //   required dynamic value,
  // }) =>
  //     value ?? defaultScrollNotificationPredicate;

  @override
  AppBar buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

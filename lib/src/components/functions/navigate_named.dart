import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Function body for the built in `navigate_pop` function.
/// The `navigate_named` function requires that the [navigatorKey] has been set on
/// the registry before it is used or an exception will be thrown.
///
/// When called, the `navigate_named` function will push a named route using
/// the [navigatorKey].
///
/// The `navigate_named` function one or two values on the `args` array:
///  1. [String] -- The name of the route to push.
///  2. [dynamic] -- <Optional> object to pass along as the route arguments.
final JsonWidgetFunction body = ({
  required List<dynamic>? args,
  required JsonWidgetRegistry registry,
}) {
  assert(registry.navigatorKey != null);

  return () => registry.navigatorKey!.currentState!.pushNamed(
        args![0],
        arguments: args.length >= 2 ? args[1] : null,
      );
};

/// Function key for the built in `navigate_named` function.
final String key = 'navigate_named';

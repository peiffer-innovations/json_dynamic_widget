import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/src/components/types.dart';

/// Function key for the built in `navigate_pop` function.  The `navigate_pop`
/// function requires that the [navigatorKey] has been set on the registry
/// before it is used or an exception will be thrown.
final String key = 'navigate_pop';

/// Function body for the built in `navigate_pop` function.
/// When called, the `navigate_pop` function will call to pop the current
/// route off the navigator stack.
///
/// The `navigate_pop` accepts a single optional value in the `args` array:
///  1. [dynamic] -- <Optional> pop result
final JsonWidgetFunction body = ({
  required List<dynamic>? args,
  required JsonWidgetRegistry registry,
}) {
  assert(registry.navigatorKey != null);

  return () => registry.navigatorKey!.currentState!.pop(
        args?.isNotEmpty == true ? args![0] : null,
      );
};

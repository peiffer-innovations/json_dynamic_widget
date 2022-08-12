import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// When called, the `navigate_pop` function will call to pop the current
/// route off the navigator stack.
///
/// The `navigate_pop` accepts a single optional value in the `args` array:
///  1. [dynamic] -- <Optional> pop result
///
///The `navigate_pop`
/// function requires that the [navigatorKey] has been set on the registry
/// before it is used or an exception will be thrown.
class NavigatePopFunction {
  static const key = 'navigate_pop';
  static final JsonWidgetFunction body = ({
    required List<dynamic>? args,
    required JsonWidgetRegistry registry,
  }) {
    assert(registry.navigatorKey != null);

    return () => registry.navigatorKey!.currentState!.pop(
          args?.isNotEmpty == true ? args![0] : null,
        );
  };
}

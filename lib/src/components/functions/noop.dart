import 'package:json_dynamic_widget/json_dynamic_widget.dart';

///The `noop` function does  nothing and exists mostly to assist with
/// testing UI elements that need a function but don't actually care what
/// the function does (such as ensuring buttons look correct when enabled).
///
/// The `noop` takes no values in the `args` array.
class NoopFunction {
  static const JsonWidgetFunction body = _body;
  static const key = 'noop';

  static dynamic _body({
    required List<dynamic>? args,
    required JsonWidgetRegistry registry,
  }) =>
      () {};
}

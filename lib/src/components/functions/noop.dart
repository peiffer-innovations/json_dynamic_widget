import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Function body for the built in `noop` function. The `noop` function does
/// nothing and exists mostly to assist with testing UI elements that need a
/// function but don't actually care what the function does (such as ensuring
/// buttons look correct when enabled).
///
/// The `noop` takes no values in the `args` array.
final JsonWidgetFunction body = ({
  required List<dynamic>? args,
  required JsonWidgetRegistry registry,
}) =>
    () {};

/// Function key for the built in `noop` function.
final String key = 'noop';

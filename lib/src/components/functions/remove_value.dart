import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Function body for the built in `remove_value` function.
/// The `remove_value` function accepts a key and a value
/// and then calls the [removeValue] function.
///
/// The `remove_value` function takes one value in the `args` array:
///  1. [String] -- the key to pass to [removeValue].
final JsonWidgetFunction body = ({
  required List<dynamic>? args,
  required JsonWidgetRegistry registry,
}) =>
    () => registry.removeValue(
          args![0],
        );

/// Function key for the built in `remove_value` function.
final String key = 'remove_value';

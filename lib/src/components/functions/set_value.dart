import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/src/components/types.dart';

/// Function body for the built in `set_value` function. The `set_value`
/// function accepts a key and a value and then calls the [setValue] function
/// with those values.
///
/// The `set_value` function takes two values in the `args` array:
///  1. [String] -- the key to pass to [setValue].
///  2. [dynamic] -- the value to pass to [setValue].
final JsonWidgetFunction body = ({
  required List<dynamic>? args,
  required JsonWidgetRegistry registry,
}) =>
    () => registry.setValue(
          args![0],
          args[1],
        );

/// Function key for the built in `set_value` function.
final String key = 'set_value';

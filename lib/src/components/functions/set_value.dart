import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// The `set_value` function accepts a key and a value and then
/// returns a [VoidCallback] that calls the [setValue] function
/// with those values when executed.
///
/// The `set_value` function takes two values in the `args` array:
///  1. [String] -- the key to pass to [setValue].
///  2. [dynamic] -- the value to pass to [setValue].
class SetValueFunction {
  static const key = 'set_value';
  static final JsonWidgetFunction body = ({
    required List<dynamic>? args,
    required JsonWidgetRegistry registry,
  }) =>
      () => registry.setValue(
            args![0],
            args[1],
            originator: null,
          );
}

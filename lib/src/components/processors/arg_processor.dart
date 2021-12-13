import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/src/components/processors/expression_arg_processor.dart';
import 'package:json_dynamic_widget/src/components/processors/iterable_arg_processor.dart';
import 'package:json_dynamic_widget/src/components/processors/legacy_function_arg_processor.dart';
import 'package:json_dynamic_widget/src/components/processors/legacy_variable_arg_processor.dart';
import 'package:json_dynamic_widget/src/components/processors/map_arg_processor.dart';
import 'package:json_dynamic_widget/src/components/processors/raw_arg_processor.dart';

abstract class ArgProcessor {
  bool support(dynamic arg);
  ProcessedArg process(JsonWidgetRegistry registry, dynamic arg);
}

class ArgProcessors {
  static final List<ArgProcessor> expression = [
    MapArgProcessor(),
    IterableArgProcessor(),
    ExpressionArgProcessor(),
    RawArgProcessor(),
  ];
  static final List<ArgProcessor> backported = [
    MapArgProcessor(),
    IterableArgProcessor(),
    ExpressionArgProcessor(),
    LegacyVariableArgProcessor(),
    LegacyFunctionArgProcessor(),
    RawArgProcessor(),
  ];
}

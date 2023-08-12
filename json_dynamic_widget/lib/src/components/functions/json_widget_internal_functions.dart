import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/src/components/functions/dynamic.dart';
import 'package:json_dynamic_widget/src/components/functions/for_each.dart';
import 'package:json_dynamic_widget/src/components/functions/length.dart';
import 'package:json_dynamic_widget/src/components/functions/log.dart';
import 'package:json_dynamic_widget/src/components/functions/navigate_named.dart';
import 'package:json_dynamic_widget/src/components/functions/navigate_pop.dart';
import 'package:json_dynamic_widget/src/components/functions/noop.dart';
import 'package:json_dynamic_widget/src/components/functions/remove_value.dart';
import 'package:json_dynamic_widget/src/components/functions/set_value.dart';

class JsonWidgetInternalFunctions {
  static Map<String, JsonWidgetFunction> defaults() {
    return JsonWidgetInternalFunctionsBuilder()
        .withDynamic()
        .withForEach()
        .withLength()
        .withLog()
        .withNavigateNamed()
        .withNavigatePop()
        .withNoop()
        .withRemoveValue()
        .withSetValue()
        .build();
  }
}

/// Used to create the selected subset of all internal functions.
class JsonWidgetInternalFunctionsBuilder {
  Map<String, JsonWidgetFunction> functions = <String, JsonWidgetFunction>{};

  JsonWidgetInternalFunctionsBuilder withDynamic() {
    functions[DynamicFunction.key] = DynamicFunction.body;
    return this;
  }

  JsonWidgetInternalFunctionsBuilder withForEach() {
    functions[ForEachFunction.key] = ForEachFunction.body;
    return this;
  }

  JsonWidgetInternalFunctionsBuilder withLength() {
    functions[LengthFunction.key] = LengthFunction.body;
    return this;
  }

  JsonWidgetInternalFunctionsBuilder withLog() {
    functions[LogFunction.key] = LogFunction.body;
    return this;
  }

  JsonWidgetInternalFunctionsBuilder withNavigateNamed() {
    functions[NavigateNamedFunction.key] = NavigateNamedFunction.body;
    return this;
  }

  JsonWidgetInternalFunctionsBuilder withNavigatePop() {
    functions[NavigatePopFunction.key] = NavigatePopFunction.body;
    return this;
  }

  JsonWidgetInternalFunctionsBuilder withNoop() {
    functions[NoopFunction.key] = NoopFunction.body;
    return this;
  }

  JsonWidgetInternalFunctionsBuilder withRemoveValue() {
    functions[RemoveValueFunction.key] = RemoveValueFunction.body;
    return this;
  }

  JsonWidgetInternalFunctionsBuilder withSetValue() {
    functions[SetValueFunction.key] = SetValueFunction.body;
    return this;
  }

  Map<String, JsonWidgetFunction> build() {
    return functions;
  }
}

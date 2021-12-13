import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/src/components/processors/arg_processor.dart';

class RawArgProcessor implements ArgProcessor {
  @override
  bool support(dynamic arg) {
    return true;
  }

  @override
  ProcessedArg process(JsonWidgetRegistry registry, dynamic arg) {
    return ProcessedArg(dynamicKeys: {}, value: arg);
  }
}

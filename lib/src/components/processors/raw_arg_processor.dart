import 'package:json_dynamic_widget/json_dynamic_widget.dart';

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

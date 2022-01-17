import 'package:json_dynamic_widget/json_dynamic_widget.dart';

abstract class ArgProcessor {
  bool support(dynamic arg);
  ProcessedArg process(
      JsonWidgetRegistry registry, dynamic arg, Set<String>? listenVariables);
}

class ArgProcessors {
  static final List<ArgProcessor> defaults = [
    MapArgProcessor(),
    IterableArgProcessor(),
    ExpressionArgProcessor(),
    RawArgProcessor(),
  ];
}

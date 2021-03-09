import 'dart:async';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

typedef JsonWidgetFunction = FutureOr<dynamic> Function({
  required List<dynamic>? args,
  required JsonWidgetRegistry registry,
});

typedef JsonWidgetBuilderBuilder = JsonWidgetBuilder? Function(
  dynamic map, {
  JsonWidgetRegistry? registry,
});

typedef DeferredBuilder = JsonWidgetBuilder Function(
  JsonWidgetBuilderBuilder builder,
);

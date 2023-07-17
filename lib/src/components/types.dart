import 'package:json_dynamic_widget/json_dynamic_widget.dart';

typedef JsonWidgetFunction = dynamic Function({
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

typedef ParamDecoder = T Function<T>({
  required ChildWidgetBuilder? childBuilder,
  required BuildContext context,
  required JsonWidgetRegistry registry,
  required dynamic value,
});

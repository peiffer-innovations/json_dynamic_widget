import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:meta/meta.dart';

typedef JsonWidgetFunction = dynamic Function({
  @required List<dynamic> args,
  @required JsonWidgetRegistry registry,
});

typedef JsonWidgetBuilderBuilder = JsonWidgetBuilder Function(
  dynamic map, {
  JsonWidgetRegistry registry,
});

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_exportable_builder.g.dart';

/// Builder that can build an [Expanded] widget.
@jsonWidget
abstract class _JsonExportableBuilder extends JsonWidgetBuilder {
  const _JsonExportableBuilder({
    required super.args,
  });

  @override
  JsonExportable buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class JsonExportable extends StatelessWidget {
  const JsonExportable({
    required this.child,
    super.key,
  });

  final JsonWidgetData child;

  @override
  Widget build(BuildContext context) {
    final exporter = JsonWidgetExporter.maybeOf(context);
    exporter?.apply(this);

    return child.build(context: context);
  }
}

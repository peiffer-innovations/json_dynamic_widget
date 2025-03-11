import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'issue_219_page.g.dart';

/// https://github.com/peiffer-innovations/json_dynamic_widget/issues/219
class Issue219Page extends StatelessWidget {
  const Issue219Page({super.key});

  @override
  Widget build(BuildContext context) {
    final registry = JsonWidgetRegistry();

    registry.registerCustomBuilder(
      JsonExampleWidgetBuilder.kType,
      const JsonWidgetBuilderContainer(
        builder: JsonExampleWidgetBuilder.fromDynamic,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Issue 219')),
      body: const SizedBox(),
    );
  }
}

class _ExampleData {}

class _ExampleWidget extends StatelessWidget {
  const _ExampleWidget(this.data);

  final _ExampleData data;

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

@jsonWidget
abstract class _JsonExampleWidgetBuilder extends JsonWidgetBuilder {
  const _JsonExampleWidgetBuilder({required super.args});

  @JsonArgEncoder('name')
  static String _encodeName(_ExampleData value) {
    return 'example';
  }

  @JsonArgDecoder('name')
  _ExampleData _decodeName({required dynamic value}) {
    return _ExampleData();
  }

  @JsonArgSchema('name')
  static Map<String, dynamic> _nameSchema() {
    return SchemaHelper.stringSchema;
  }

  @JsonPositionedParam('data')
  @JsonArgAlias(alias: 'name', name: 'data')
  @override
  _ExampleWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class FullWidgetPage extends StatelessWidget {
  const FullWidgetPage({super.key, required this.data});

  final JsonWidgetData data;

  @override
  Widget build(BuildContext context) => data.build(context: context);
}

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class UntestableFullWidgetPage extends StatelessWidget {
  const UntestableFullWidgetPage({super.key, required this.data});

  final JsonWidgetData data;

  @override
  Widget build(BuildContext context) => data.build(context: context);
}

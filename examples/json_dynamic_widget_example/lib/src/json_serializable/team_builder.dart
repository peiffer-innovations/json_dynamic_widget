import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'person.dart';
import 'team_widget.dart';

part 'team_builder.g.dart';

@jsonWidget
abstract class _TeamBuilder extends JsonWidgetBuilder {
  const _TeamBuilder({required super.args});

  @override
  TeamWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

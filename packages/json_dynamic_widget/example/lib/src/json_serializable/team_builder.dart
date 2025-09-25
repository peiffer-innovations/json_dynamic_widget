import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'person.dart';
import 'team_widget.dart';

part 'team_builder.g.dart';

@jsonWidget
abstract class _PersonBuilder extends JsonWidgetBuilder {
  const _PersonBuilder({required super.args});

  @override
  TeamWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

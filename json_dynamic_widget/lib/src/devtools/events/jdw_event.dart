import 'package:json_dynamic_widget/devtools.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

abstract class JdwEvent extends JsonClass {
  JdwEvent({
    required this.id,
  });

  static final Map<String, JdwEvent Function(dynamic)> _events = {
    AnnounceWidgetDataEvent.kId: AnnounceWidgetDataEvent.fromDynamic,
    HighlightWidgetEvent.kId: HighlightWidgetEvent.fromDynamic,
    UpdateWidgetDataEvent.kId: UpdateWidgetDataEvent.fromDynamic,
  };

  final String id;

  static JdwEvent fromDynamic(dynamic map) {
    final id = map['id'].toString();
    final builder = _events[id];
    if (builder == null) {
      throw Exception('Unknown event type received: $id');
    }

    return builder(map);
  }
}

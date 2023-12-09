import 'package:json_dynamic_widget/devtools.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class HighlightWidgetEvent extends JdwEvent {
  HighlightWidgetEvent({
    this.enabled = true,
    super.id = kId,
    required this.widgetId,
  });

  static const String kId = 'highlight_widget';

  final bool enabled;
  final String widgetId;

  static HighlightWidgetEvent fromDynamic(dynamic map) {
    if (map == null) {
      throw Exception('$kId: map is null');
    }

    return HighlightWidgetEvent(
      enabled: JsonClass.parseBool(map['enabled'], whenNull: true),
      widgetId: map['widgetId'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'enabled': enabled,
        'id': id,
        'widgetId': widgetId,
      };
}

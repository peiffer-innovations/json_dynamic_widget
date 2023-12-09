import 'package:json_dynamic_widget/devtools.dart';

class AnnounceWidgetDataEvent extends JdwEvent {
  AnnounceWidgetDataEvent({
    required this.data,
    super.id = kId,
    required this.widgetId,
  });

  static const String kId = 'announce_widget_data';

  final Map<String, dynamic> data;
  final String widgetId;

  static AnnounceWidgetDataEvent fromDynamic(dynamic map) {
    if (map == null) {
      throw Exception('$kId: map is null');
    }

    return AnnounceWidgetDataEvent(
      data: Map<String, dynamic>.from(map['data']),
      widgetId: map['widgetId'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'data': data,
        'id': id,
        'widgetId': widgetId,
      };
}

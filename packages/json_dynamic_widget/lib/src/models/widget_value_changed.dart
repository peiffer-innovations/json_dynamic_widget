import 'package:meta/meta.dart';

@immutable
class WidgetValueChanged {
  const WidgetValueChanged({
    required this.id,
    required this.originator,
    required this.value,
  });

  final String id;
  final String? originator;
  final dynamic value;

  bool get isSelfTriggered => id == originator;
}

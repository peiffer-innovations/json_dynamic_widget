import 'dart:async';

import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:json_dynamic_widget/devtools.dart';

class EventListener {
  factory EventListener() => _instance;
  EventListener._();
  static final EventListener _instance = EventListener._();

  // ignore: close_sinks
  final StreamController<JdwEvent> _eventController =
      StreamController<JdwEvent>.broadcast();

  StreamSubscription? _subscription;

  Stream<JdwEvent> get eventStream => _eventController.stream;

  void startListening() {
    stopListening();

    _subscription = serviceManager.service!.onExtensionEvent.listen((e) {
      final data = e.extensionData?.data;
      if (e.extensionKind?.startsWith('${Devtools.kEventPrefix}:') == true) {
        final event = JdwEvent.fromDynamic(data);
      }
    });
  }

  void stopListening() {
    _subscription?.cancel();
    _subscription = null;
  }
}

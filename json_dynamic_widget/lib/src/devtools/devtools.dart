import 'dart:async';
import 'dart:developer' as developer;

import 'package:json_dynamic_widget/src/devtools/events/jdw_event.dart';

const _releaseMode = bool.fromEnvironment('dart.vm.product');
// const _profileMode = bool.fromEnvironment('dart.vm.profile');

abstract class Devtools {
  factory Devtools() => !_releaseMode ||
          const bool.fromEnvironment('json_dynamic_widget_devtools')
      ? _RealDevtools._()
      : _NoOpDevtools._();

  static const kEventPrefix = 'json_dynamic_widget';

  // ignore: close_sinks
  static final StreamController<JdwEvent> _eventController =
      StreamController<JdwEvent>.broadcast();

  Stream<JdwEvent> get eventStream => _eventController.stream;

  void postEvent(JdwEvent event) {
    // no-op
  }

  void register() {
    developer.registerExtension('ext.json_dynamic_widget.widget', () {});
  }
}

class _RealDevtools extends Devtools {
  factory _RealDevtools._() => _instance;
  static final _RealDevtools _instance = _RealDevtools._();

  @override
  void postEvent(JdwEvent event) {
    developer.postEvent(
      '${Devtools.kEventPrefix}:${event.id}',
      event.toJson(),
    );
  }
}

class _NoOpDevtools extends Devtools {
  factory _NoOpDevtools._() => _instance;
  static final _NoOpDevtools _instance = _NoOpDevtools._();
}

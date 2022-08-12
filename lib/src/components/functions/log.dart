import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:logging/logging.dart';

/// The `log` function takes 1 or
/// 2 arguments.  The first is the message to log and the second is optional and
/// is the level to log the message with.
class LogFunction {
  static final _logger = Logger('log');
  static const key = 'log';
  static final JsonWidgetFunction body = ({
    required List<dynamic>? args,
    required JsonWidgetRegistry registry,
  }) =>
      () {
        Level level;

        var message = args![0];

        var levelArg =
            (args.length >= 2 ? args[1] : '').toString().toLowerCase();
        switch (levelArg) {
          case 'fine':
            level = Level.FINE;
            break;

          case 'finer':
            level = Level.FINER;
            break;

          case 'finest':
            level = Level.FINEST;
            break;

          case 'info':
            level = Level.INFO;
            break;

          case 'severe':
            level = Level.SEVERE;
            break;

          case 'shout':
            level = Level.SHOUT;
            break;

          case 'warning':
            level = Level.WARNING;
            break;

          default:
            level = Level.FINEST;
            break;
        }

        _logger.log(level, '$message');
      };
}

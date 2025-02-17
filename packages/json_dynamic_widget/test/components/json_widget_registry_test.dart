import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('internal variable', () {
    /// This registry is overriding the built-in value of
    /// `bounce_in_curve`
    final registry = JsonWidgetRegistry(
      values: {'bounce_in_curve': Curves.bounceInOut},
    );

    expect(
      registry.processArgs({'bounce_in_curve': '\${bounce_in_curve}'}, null),
      const ProcessedArg(
        jsonWidgetListenVariables: {'bounce_in_curve'},
        value: {'bounce_in_curve': Curves.bounceInOut},
      ),
    );

    expect(
      registry.processArgs({'decelerate_curve': '\${decelerate_curve}'}, null),
      const ProcessedArg(
        jsonWidgetListenVariables: {'decelerate_curve'},
        value: {'decelerate_curve': Curves.decelerate},
      ),
    );
  });

  test('default arg processors', () {
    final registry = JsonWidgetRegistry(
      values: {'one': 1, 'string': 'foo', 'name': 'Steve', 'twoPointFive': 2.5},
      functions: {
        'concat':
            ({
              required List<dynamic>? args,
              required JsonWidgetRegistry registry,
            }) => () {
              return args!.join();
            },
      },
    );

    expect(
      registry.processArgs('Hello world!', null).toString(),
      const ProcessedArg(
        jsonWidgetListenVariables: {},
        value: 'Hello world!',
      ).toString(),
    );

    expect(
      registry.processArgs('\${one}', null).toString(),
      const ProcessedArg(
        jsonWidgetListenVariables: {'one'},
        value: 1,
      ).toString(),
    );
    expect(
      registry.processArgs('\${one + one}', null).toString(),
      const ProcessedArg(
        jsonWidgetListenVariables: {'one'},
        value: 2,
      ).toString(),
    );
    expect(
      registry
          .processArgs(
            "\${concat('Hello ',name,'! Here\\'s the map: ',{'key': 'value'}, ' and the array: ', ['value1', false])()}",
            null,
          )
          .toString(),
      const ProcessedArg(
        jsonWidgetListenVariables: {'name'},
        value:
            "Hello Steve! Here's the map: {key: value} and the array: [value1, false]",
      ).toString(),
    );
    expect(
      registry
          .processArgs("\${concat('Hello ', concat('Mr. ', name)())()}", null)
          .toString(),
      const ProcessedArg(
        jsonWidgetListenVariables: {'name'},
        value: 'Hello Mr. Steve',
      ).toString(),
    );
    expect(
      registry.processArgs({'\${string}': '\${name}'}, null).toString(),
      const ProcessedArg(
        jsonWidgetListenVariables: {'string', 'name'},
        value: {'foo': 'Steve'},
      ).toString(),
    );
    expect(
      registry.processArgs(['\${string}', '\${name}'], null).toString(),
      const ProcessedArg(
        jsonWidgetListenVariables: {'string', 'name'},
        value: ['foo', 'Steve'],
      ).toString(),
    );
  });
}

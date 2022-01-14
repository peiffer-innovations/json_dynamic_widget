import 'package:flutter/animation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('internal variable', () {
    /// This registry is overriding the built-in value of
    /// `bounce_in_curve`
    var registry = JsonWidgetRegistry(
      values: {
        'bounce_in_curve': Curves.bounceInOut,
      },
    );

    expect(
      registry.processArgs(
        {
          'bounce_in_curve': '\${bounce_in_curve}',
        },
      ),
      ProcessedArg(
        dynamicKeys: {'bounce_in_curve'},
        value: {
          'bounce_in_curve': Curves.bounceInOut,
        },
      ),
    );

    expect(
      registry.processArgs(
        {
          'decelerate_curve': '\${decelerate_curve}',
        },
      ),
      ProcessedArg(
        dynamicKeys: {'decelerate_curve'},
        value: {
          'decelerate_curve': Curves.decelerate,
        },
      ),
    );
  });

  test('default arg processors', () {
    var registry = JsonWidgetRegistry(
      values: {
        'one': 1,
        'string': 'foo',
        'name': 'Steve',
        'twoPointFive': 2.5,
      },
      functions: {
        'concat': ({
          required List<dynamic>? args,
          required JsonWidgetRegistry registry,
        }) =>
            () {
              return args!.join();
            }
      },
    );

    expect(
      registry.processArgs('Hello world!').toString(),
      ProcessedArg(dynamicKeys: {}, value: 'Hello world!').toString(),
    );

    expect(
      registry.processArgs('\${one}').toString(),
      ProcessedArg(dynamicKeys: {'one'}, value: 1).toString(),
    );
    expect(
      registry.processArgs('\${one + one}').toString(),
      ProcessedArg(dynamicKeys: {'one'}, value: 2).toString(),
    );
    expect(
      registry
          .processArgs(
              "\${concat('Hello ',name,'! Here\\'s the map: ',{'key': 'value'}, ' and the array: ', ['value1', false])()}")
          .toString(),
      ProcessedArg(dynamicKeys: {
        'name'
      }, value: "Hello Steve! Here's the map: {key: value} and the array: [value1, false]")
          .toString(),
    );
    expect(
      registry
          .processArgs("\${concat('Hello ', concat('Mr. ', name)())()}")
          .toString(),
      ProcessedArg(dynamicKeys: {'name'}, value: 'Hello Mr. Steve').toString(),
    );
  });
}

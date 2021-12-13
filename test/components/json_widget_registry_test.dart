import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('params', () {
    var registry = JsonWidgetRegistry(
      values: {
        'one': 1,
        'false': false,
        'string': 'foo',
        'true': true,
        'twoPointFive': 2.5,
      },
    );

    expect(
      registry.processArgs({
        'one': '{{one}}',
        'false': '{{false}}',
        'string': '{{string}}',
        'true': '{{true}}',
        'twoPointFive': '{{twoPointFive}}',
        'constant': 'constant',
      }),
      ProcessedArg(
        dynamicKeys: {'one', 'false', 'string', 'true', 'twoPointFive'},
        value: {
          'one': 1,
          'false': false,
          'string': 'foo',
          'true': true,
          'twoPointFive': 2.5,
          'constant': 'constant',
        },
      ),
    );

    expect(
      registry.processArgs([
        '{{one}}',
        '{{false}}',
        '{{string}}',
        '{{true}}',
        '{{twoPointFive}}',
        'constant'
      ]),
      ProcessedArg(
        dynamicKeys: {'one', 'false', 'string', 'true', 'twoPointFive'},
        value: [
          1,
          false,
          'foo',
          true,
          2.5,
          'constant',
        ],
      ),
    );
    expect(
      registry.processArgs({
        'nested': {
          'one': '{{one}}',
          'false': '{{false}}',
          'string': '{{string}}',
          'true': '{{true}}',
          'twoPointFive': '{{twoPointFive}}'
        },
      }),
      ProcessedArg(
        dynamicKeys: {'one', 'false', 'string', 'true', 'twoPointFive'},
        value: {
          'nested': {
            'one': 1,
            'false': false,
            'string': 'foo',
            'true': true,
            'twoPointFive': 2.5,
          },
        },
      ),
    );
  });

  test('function', () {
    String? result;
    var registry = JsonWidgetRegistry(
      functions: {
        'test': ({args, required registry}) {
          result = args?.toList().join('|');

          return result;
        }
      },
      values: {
        'one': 1,
        'false': false,
        'string': 'foo',
        'true': true,
        'twoPointFive': 2.5,
      },
    );

    expect(
      registry.processArgs('##test()##'),
      ProcessedArg(
        dynamicKeys: {'__FUNCTION__'},
        value: '',
      ),
    );
    expect(result, '');

    expect(
      registry.processArgs('##test({{one}})##'),
      ProcessedArg(
        dynamicKeys: {'__FUNCTION__', 'one'},
        value: '1',
      ),
    );
    expect(result, '1');

    expect(
      registry.processArgs('##test(foo)##'),
      ProcessedArg(
        dynamicKeys: {'__FUNCTION__'},
        value: 'foo',
      ),
    );
    expect(result, 'foo');

    expect(
      registry.processArgs({
        'nested': {
          'foo': '##test(foo, {{one}})##',
          'bar': '{{twoPointFive}}',
        },
      }),
      ProcessedArg(
        dynamicKeys: {'__FUNCTION__', 'one', 'twoPointFive'},
        value: {
          'nested': {
            'foo': 'foo|1',
            'bar': 2.5,
          },
        },
      ),
    );
    expect(result, 'foo|1');

    expect(
      registry.processArgs({
        'nested': {
          'foo':
              '##test( {{one}}, {{false}} ,  {{string}}, {{true}}, {{twoPointFive}}, constant  )##',
        },
      }),
      ProcessedArg(
        dynamicKeys: {
          '__FUNCTION__',
          'one',
          'false',
          'string',
          'true',
          'twoPointFive'
        },
        value: {
          'nested': {
            'foo': '1|false|foo|true|2.5|constant',
          },
        },
      ),
    );
    expect(result, '1|false|foo|true|2.5|constant');

    expect(
      registry.processArgs({
        'nested': [
          'foo',
          '##test( cons tant, {{one}}, {{false}} ,  {{string}}, {{true}}, {{twoPointFive}}, constant  )##',
          '{{one}}',
        ],
      }),
      ProcessedArg(
        dynamicKeys: {
          '__FUNCTION__',
          'one',
          'false',
          'string',
          'true',
          'twoPointFive'
        },
        value: {
          'nested': [
            'foo',
            'cons tant|1|false|foo|true|2.5|constant',
            1,
          ],
        },
      ),
    );
    expect(result, 'cons tant|1|false|foo|true|2.5|constant');
  });

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
          'bounce_in_curve': '{{bounce_in_curve}}',
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
          'decelerate_curve': '{{decelerate_curve}}',
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

  test('expression arg processors', () {
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
      ProcessedArg(dynamicKeys: {'name'}, value: 'Hello Mr. Steve')
          .toString(),
    );
  });

  test('json path', () {
    var people = [
      {
        'firstName': 'John',
        'lastName': 'Smith',
        'address': {
          'street': '1234 Lane Ave',
          'city': 'Springfield',
          'state': 'OH',
        }
      },
      {
        'firstName': 'Jane',
        'lastName': 'Smith',
        'address': {
          'street': '1234 Lane Ave',
          'city': 'Springfield',
          'state': 'MI',
        }
      },
    ];

    var registry = JsonWidgetRegistry(values: {'people': people});

    expect(
      registry.getValue(r'people;$[0].firstName'),
      'John',
    );
    expect(
      registry.getValue(r'people;$[1].address.state'),
      'MI',
    );

    expect(
      registry.getValue(r'people;$'),
      people,
    );

    registry = JsonWidgetRegistry(values: {'people': json.encode(people)});

    expect(
      registry.getValue(r'people;$[0].firstName'),
      'John',
    );
    expect(
      registry.getValue(r'people;$[1].address.state'),
      'MI',
    );

    expect(
      registry.getValue(r'people;$'),
      people,
    );
  });
}

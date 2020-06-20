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
      registry.processDynamicArgs({
        'one': '{{one}}',
        'false': '{{false}}',
        'string': '{{string}}',
        'true': '{{true}}',
        'twoPointFive': '{{twoPointFive}}',
        'constant': 'constant',
      }),
      {
        'one': 1,
        'false': false,
        'string': 'foo',
        'true': true,
        'twoPointFive': 2.5,
        'constant': 'constant',
      },
    );

    expect(
      registry.processDynamicArgs([
        '{{one}}',
        '{{false}}',
        '{{string}}',
        '{{true}}',
        '{{twoPointFive}}',
        'constant'
      ]),
      [
        1,
        false,
        'foo',
        true,
        2.5,
        'constant',
      ],
    );
    expect(
      registry.processDynamicArgs({
        'nested': {
          'one': '{{one}}',
          'false': '{{false}}',
          'string': '{{string}}',
          'true': '{{true}}',
          'twoPointFive': '{{twoPointFive}}'
        },
      }),
      {
        'nested': {
          'one': 1,
          'false': false,
          'string': 'foo',
          'true': true,
          'twoPointFive': 2.5,
        },
      },
    );
  });

  test('function', () {
    String result;
    var registry = JsonWidgetRegistry(
      functions: {
        'test': (args) {
          result = args?.toList()?.join('|');

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

    expect(registry.processDynamicArgs('##test()##'), '');
    expect(result, '');

    expect(registry.processDynamicArgs('##test({{one}})##'), '1');
    expect(result, '1');

    expect(registry.processDynamicArgs('##test(foo)##'), 'foo');
    expect(result, 'foo');

    expect(
      registry.processDynamicArgs({
        'nested': {
          'foo': '##test(foo, {{one}})##',
          'bar': '{{twoPointFive}}',
        },
      }),
      {
        'nested': {
          'foo': 'foo|1',
          'bar': 2.5,
        },
      },
    );
    expect(result, 'foo|1');

    expect(
      registry.processDynamicArgs({
        'nested': {
          'foo':
              '##test( {{one}}, {{false}} ,  {{string}}, {{true}}, {{twoPointFive}}, constant  )##',
        },
      }),
      {
        'nested': {
          'foo': '1|false|foo|true|2.5|constant',
        },
      },
    );
    expect(result, '1|false|foo|true|2.5|constant');

    expect(
      registry.processDynamicArgs({
        'nested': [
          'foo',
          '##test( cons tant, {{one}}, {{false}} ,  {{string}}, {{true}}, {{twoPointFive}}, constant  )##',
          '{{one}}',
        ],
      }),
      {
        'nested': [
          'foo',
          'cons tant|1|false|foo|true|2.5|constant',
          1,
        ],
      },
    );
    expect(result, 'cons tant|1|false|foo|true|2.5|constant');
  });
}

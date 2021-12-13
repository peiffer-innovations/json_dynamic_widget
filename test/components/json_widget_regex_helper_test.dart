import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/src/components/json_widget_regex_helper.dart';

void main() {
  test('null', () {
    var parsed = JsonWidgetRegexHelper.parse(null);

    expect(parsed, null);
  });

  test('empty', () {
    var parsed = JsonWidgetRegexHelper.parse('');

    expect(parsed, null);
  });

  test('simple string', () {
    expect(
      JsonWidgetRegexHelper.parse('foo'),
      [
        JsonWidgetParams(
          key: 'foo',
          originalValue: 'foo',
        ),
      ],
    );

    expect(
      JsonWidgetRegexHelper.parse('  foo  '),
      [
        JsonWidgetParams(
          key: '  foo  ',
          originalValue: '  foo  ',
        ),
      ],
    );

    expect(
      JsonWidgetRegexHelper.parse(
        'The quick brown fox jumps over the lazy dog',
      ),
      [
        JsonWidgetParams(
          key: 'The quick brown fox jumps over the lazy dog',
          originalValue: 'The quick brown fox jumps over the lazy dog',
        ),
      ],
    );
    expect(
      JsonWidgetRegexHelper.parse(
        'The quick brown fox, jumps over the lazy dog',
      ),
      [
        JsonWidgetParams(
          key: 'The quick brown fox, jumps over the lazy dog',
          originalValue: 'The quick brown fox, jumps over the lazy dog',
        ),
      ],
    );

    expect(
      JsonWidgetRegexHelper.parse(
        'myFunction({{param1}}, const1, {{param2}}, {{param3}}, const2, const3)',
      ),
      [
        JsonWidgetParams(
          key:
              'myFunction({{param1}}, const1, {{param2}}, {{param3}}, const2, const3)',
          originalValue:
              'myFunction({{param1}}, const1, {{param2}}, {{param3}}, const2, const3)',
        ),
      ],
    );
  });

  test('simple param', () {
    expect(
      JsonWidgetRegexHelper.parse('{{foo}}'),
      [
        JsonWidgetParams(
          isVariable: true,
          key: 'foo',
          originalValue: '{{foo}}',
        ),
      ],
    );
    expect(
      JsonWidgetRegexHelper.parse('{{  foo  }}'),
      [
        JsonWidgetParams(
          isVariable: true,
          key: 'foo',
          originalValue: '{{  foo  }}',
        ),
      ],
    );
    expect(
      JsonWidgetRegexHelper.parse('!{{foo}}'),
      [
        JsonWidgetParams(
          isStatic: true,
          isVariable: true,
          key: 'foo',
          originalValue: '!{{foo}}',
        ),
      ],
    );
    expect(
      JsonWidgetRegexHelper.parse('!{{  foo  }}'),
      [
        JsonWidgetParams(
          isStatic: true,
          isVariable: true,
          key: 'foo',
          originalValue: '!{{  foo  }}',
        ),
      ],
    );
  });

  test('expression', () {
    var parsed = JsonWidgetRegexHelper.parse(
      '##expression(add(subtract(2, 1), add(1, 1)))##',
    );

    expect(
      parsed![0],
      JsonWidgetParams(
        isFunction: true,
        key: 'expression',
        originalValue: '##expression(add(subtract(2, 1), add(1, 1)))##',
      ),
    );
  });

  test('complex function', () {
    var parsed = JsonWidgetRegexHelper.parse(
      '##myFunction({{param1}}, const1, !{{param2}}, {{param3}}, const2, const3)##',
    );

    expect(
      parsed,
      [
        JsonWidgetParams(
          isFunction: true,
          key: 'myFunction',
          originalValue:
              '##myFunction({{param1}}, const1, !{{param2}}, {{param3}}, const2, const3)##',
        ),
        JsonWidgetParams(
          isVariable: true,
          key: 'param1',
          originalValue: '{{param1}}',
        ),
        JsonWidgetParams(
          key: 'const1',
          originalValue: 'const1',
        ),
        JsonWidgetParams(
          isStatic: true,
          isVariable: true,
          key: 'param2',
          originalValue: '!{{param2}}',
        ),
        JsonWidgetParams(
          isVariable: true,
          key: 'param3',
          originalValue: '{{param3}}',
        ),
        JsonWidgetParams(
          key: 'const2',
          originalValue: 'const2',
        ),
        JsonWidgetParams(
          key: 'const3',
          originalValue: 'const3',
        ),
      ],
    );

    parsed = JsonWidgetRegexHelper.parse(
      '##myFunction({{param1}}, [1\\,2\\,3], !{{param2}}, {{param3}}, const2, const3)##',
    );

    expect(
      parsed,
      [
        JsonWidgetParams(
          isFunction: true,
          key: 'myFunction',
          originalValue:
              '##myFunction({{param1}}, [1\\,2\\,3], !{{param2}}, {{param3}}, const2, const3)##',
        ),
        JsonWidgetParams(
          isVariable: true,
          key: 'param1',
          originalValue: '{{param1}}',
        ),
        JsonWidgetParams(
          key: '[1,2,3]',
          originalValue: '[1,2,3]',
        ),
        JsonWidgetParams(
          isStatic: true,
          isVariable: true,
          key: 'param2',
          originalValue: '!{{param2}}',
        ),
        JsonWidgetParams(
          isVariable: true,
          key: 'param3',
          originalValue: '{{param3}}',
        ),
        JsonWidgetParams(
          key: 'const2',
          originalValue: 'const2',
        ),
        JsonWidgetParams(
          key: 'const3',
          originalValue: 'const3',
        ),
      ],
    );
  });

  test('named params function', () {
    var parsed = JsonWidgetRegexHelper.parse(
      '##myFunction(items:{{param1}}, const1, values:!{{param2}}, {{param3}}, const2, const3)##',
    );

    expect(
      parsed,
      [
        JsonWidgetParams(
          isFunction: true,
          key: 'myFunction',
          originalValue:
              '##myFunction(items:{{param1}}, const1, values:!{{param2}}, {{param3}}, const2, const3)##',
        ),
        JsonWidgetParams(
          isNamedVariable: true,
          isVariable: true,
          key: 'param1',
          originalValue: 'items:{{param1}}',
        ),
        JsonWidgetParams(
          key: 'const1',
          originalValue: 'const1',
        ),
        JsonWidgetParams(
          isNamedVariable: true,
          isStatic: true,
          isVariable: true,
          key: 'param2',
          originalValue: 'values:!{{param2}}',
        ),
        JsonWidgetParams(
          isVariable: true,
          key: 'param3',
          originalValue: '{{param3}}',
        ),
        JsonWidgetParams(
          key: 'const2',
          originalValue: 'const2',
        ),
        JsonWidgetParams(
          key: 'const3',
          originalValue: 'const3',
        ),
      ],
    );
  });

  test('expression arg processors', () {
    var registry = JsonWidgetRegistry(
      values: {
        'one': 1,
        'map': {
          'field1': [
            {'field2': 'Christopher'}
          ],
        },
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
    expect(
      registry
          .processArgs("\${'Hello '+ map['field1'][0]['field2']}")
          .toString(),
      ProcessedArg(dynamicKeys: {'map'}, value: 'Hello Christopher').toString(),
    );
  });
}

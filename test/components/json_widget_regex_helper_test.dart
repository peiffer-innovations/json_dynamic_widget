import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

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
        JsonWidgetParams(key: 'foo'),
      ],
    );

    expect(
      JsonWidgetRegexHelper.parse('  foo  '),
      [
        JsonWidgetParams(key: '  foo  '),
      ],
    );

    expect(
      JsonWidgetRegexHelper.parse(
        'The quick brown fox jumps over the lazy dog',
      ),
      [
        JsonWidgetParams(key: 'The quick brown fox jumps over the lazy dog'),
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
        ),
      ],
    );
    expect(
      JsonWidgetRegexHelper.parse('{{  foo  }}'),
      [
        JsonWidgetParams(
          isVariable: true,
          key: 'foo',
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
      ),
    );
  });

  test('complex function', () {
    var parsed = JsonWidgetRegexHelper.parse(
      '##myFunction({{param1}}, const1, {{param2}}, {{param3}}, const2, const3)##',
    );

    expect(
      parsed,
      [
        JsonWidgetParams(
          isFunction: true,
          key: 'myFunction',
        ),
        JsonWidgetParams(
          isVariable: true,
          key: 'param1',
        ),
        JsonWidgetParams(key: 'const1'),
        JsonWidgetParams(
          isVariable: true,
          key: 'param2',
        ),
        JsonWidgetParams(
          isVariable: true,
          key: 'param3',
        ),
        JsonWidgetParams(key: 'const2'),
        JsonWidgetParams(key: 'const3'),
      ],
    );
  });
}

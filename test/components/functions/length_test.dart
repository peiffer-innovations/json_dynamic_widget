import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'package:json_dynamic_widget/src/components/functions/length.dart';

void main() {
  test('length: double', () {
    expect(
      LengthFunction.body(args: [100.1], registry: JsonWidgetRegistry.instance),
      100,
    );

    expect(
      LengthFunction.body(args: [-1.5], registry: JsonWidgetRegistry.instance),
      -1,
    );

    expect(
      LengthFunction.body(args: [25.0], registry: JsonWidgetRegistry.instance),
      25,
    );
  });

  test('length: int', () {
    expect(
      LengthFunction.body(args: [100], registry: JsonWidgetRegistry.instance),
      100,
    );

    expect(
      LengthFunction.body(args: [-1], registry: JsonWidgetRegistry.instance),
      -1,
    );
  });

  test('length: list', () {
    var list = [];

    for (var i = 0; i < 5; i++) {
      expect(
        LengthFunction.body(
            args: [list], registry: JsonWidgetRegistry.instance),
        i,
      );
      expect(
        LengthFunction.body(
          args: [json.encode(list)],
          registry: JsonWidgetRegistry.instance,
        ),
        i,
      );

      list.add(i);
    }
  });

  test('length: map', () {
    var map = {};

    for (var i = 0; i < 5; i++) {
      expect(
        LengthFunction.body(args: [map], registry: JsonWidgetRegistry.instance),
        i,
      );
      expect(
        LengthFunction.body(
          args: [json.encode(map)],
          registry: JsonWidgetRegistry.instance,
        ),
        i,
      );

      map['$i'] = '$i';
    }
  });

  test('length: set', () {
    var set = <String>{};

    for (var i = 0; i < 5; i++) {
      expect(
        LengthFunction.body(args: [set], registry: JsonWidgetRegistry.instance),
        i,
      );

      set.add('$i');
    }
  });

  test('length: string', () {
    expect(
      LengthFunction.body(args: ['100'], registry: JsonWidgetRegistry.instance),
      3,
    );

    expect(
      LengthFunction.body(args: [''], registry: JsonWidgetRegistry.instance),
      0,
    );

    expect(
      LengthFunction.body(
          args: ['abcdef'], registry: JsonWidgetRegistry.instance),
      6,
    );
  });

  test('length: other', () {
    try {
      LengthFunction.body(
          args: [Object()], registry: JsonWidgetRegistry.instance);

      fail('Expected exception');
    } catch (e) {
      // pass
    }
  });
}

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'package:json_dynamic_widget/src/components/functions/length.dart'
    as length;

void main() {
  test('length: double', () {
    expect(
      length.body(args: [100.1], registry: JsonWidgetRegistry.instance),
      100,
    );

    expect(
      length.body(args: [-1.5], registry: JsonWidgetRegistry.instance),
      -1,
    );

    expect(
      length.body(args: [25.0], registry: JsonWidgetRegistry.instance),
      25,
    );
  });

  test('length: int', () {
    expect(
      length.body(args: [100], registry: JsonWidgetRegistry.instance),
      100,
    );

    expect(
      length.body(args: [-1], registry: JsonWidgetRegistry.instance),
      -1,
    );
  });

  test('length: list', () {
    var list = [];

    for (var i = 0; i < 5; i++) {
      expect(
        length.body(args: [list], registry: JsonWidgetRegistry.instance),
        i,
      );
      expect(
        length.body(
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
        length.body(args: [map], registry: JsonWidgetRegistry.instance),
        i,
      );
      expect(
        length.body(
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
        length.body(args: [set], registry: JsonWidgetRegistry.instance),
        i,
      );

      set.add('$i');
    }
  });

  test('length: string', () {
    expect(
      length.body(args: ['100'], registry: JsonWidgetRegistry.instance),
      3,
    );

    expect(
      length.body(args: [''], registry: JsonWidgetRegistry.instance),
      0,
    );

    expect(
      length.body(args: ['abcdef'], registry: JsonWidgetRegistry.instance),
      6,
    );
  });

  test('length: other', () {
    try {
      length.body(args: [Object()], registry: JsonWidgetRegistry.instance);

      fail('Expected exception');
    } catch (e) {
      // pass
    }
  });
}

import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class HandledJsonWidgetException implements Exception {
  HandledJsonWidgetException(
    this.cause,
    this.stackTrace, {
    this.data,
  });

  final dynamic cause;
  final dynamic data;
  final StackTrace? stackTrace;

  @override
  String toString() => '''
*** HandledJsonWidgetException ***
${data == null ? '<no data>' : ((data is Map || data is List) ? JsonEncoder.withIndent('  ').convert(data) : data.toString())}
${cause == null ? '<no cause>' : cause.toString()}
${stackTrace == null ? '<no stack>' : stackTrace.toString()}
''';
}

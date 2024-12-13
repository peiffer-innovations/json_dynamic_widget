import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class HandledJsonWidgetException implements Exception {
  const HandledJsonWidgetException(
    this.cause, {
    this.stackTrace,
    this.data,
  });

  final dynamic cause;
  final dynamic data;
  final StackTrace? stackTrace;

  @override
  String toString() {
    final buf = StringBuffer();

    buf.writeln('*** HandledJsonWidgetException ***');
    if (cause != null) {
      buf.writeln(cause.toString());
    }
    if (data != null) {
      buf.writeln((data is Map || data is List)
          ? const JsonEncoder.withIndent('  ').convert(data)
          : data.toString());
    }
    if (stackTrace != null) {
      buf.writeln(stackTrace.toString());
    }

    return buf.toString();
  }
}

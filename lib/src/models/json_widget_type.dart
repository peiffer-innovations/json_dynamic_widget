import 'package:meta/meta.dart';

@immutable
class JsonWidgetType {
  const JsonWidgetType(
    this.code, {
    this.skipDeepArgs,
  }) : assert(code != null);

  final String code;
  final Set<String> skipDeepArgs;

  @override
  bool operator ==(other) {
    var result = false;

    if (other is JsonWidgetType) {
      result = other.code == code;
    }

    return result;
  }

  @override
  int get hashCode => code.hashCode;
}

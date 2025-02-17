import 'package:meta/meta.dart';

@immutable
class ProcessedArg {
  const ProcessedArg({
    required this.jsonWidgetListenVariables,
    required this.value,
  });

  final Set<String> jsonWidgetListenVariables;
  final dynamic value;

  @override
  bool operator ==(other) {
    var result = false;

    if (other is ProcessedArg) {
      result = true;
      result =
          result &&
          jsonWidgetListenVariables.toString() ==
              other.jsonWidgetListenVariables.toString();
      result = result && value?.toString() == other.value?.toString();
    }

    return result;
  }

  @override
  int get hashCode =>
      (31 * (jsonWidgetListenVariables.hashCode)) * (value?.hashCode ?? 0);

  @override
  String toString() => 'ProcessedArg({$jsonWidgetListenVariables}, {$value})';
}

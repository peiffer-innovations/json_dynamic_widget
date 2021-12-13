import 'package:meta/meta.dart';

@immutable
class ProcessedArg {
  const ProcessedArg({
    required this.dynamicKeys,
    required this.value,
  });

  final Set<String> dynamicKeys;
  final dynamic value;

  @override
  bool operator ==(other) {
    var result = false;

    if (other is ProcessedArg) {
      result = true;
      result = result && dynamicKeys.toString() == other.dynamicKeys.toString();
      result = result && value?.toString() == other.value?.toString();
    }

    return result;
  }

  @override
  int get hashCode => (31 * (dynamicKeys.hashCode)) * (value?.hashCode ?? 0);

  @override
  String toString() => 'ProcessedArg({$dynamicKeys}, {$value})';
}

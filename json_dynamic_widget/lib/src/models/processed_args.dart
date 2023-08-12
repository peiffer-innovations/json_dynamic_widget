import 'package:meta/meta.dart';

@immutable
class ProcessedArg {
  const ProcessedArg({
    required this.listenVariables,
    required this.value,
  });

  final Set<String> listenVariables;
  final dynamic value;

  @override
  bool operator ==(other) {
    var result = false;

    if (other is ProcessedArg) {
      result = true;
      result = result &&
          listenVariables.toString() == other.listenVariables.toString();
      result = result && value?.toString() == other.value?.toString();
    }

    return result;
  }

  @override
  int get hashCode =>
      (31 * (listenVariables.hashCode)) * (value?.hashCode ?? 0);

  @override
  String toString() => 'ProcessedArg({$listenVariables}, {$value})';
}

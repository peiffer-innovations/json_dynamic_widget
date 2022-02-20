import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Arg processor allows to process [JsonWidgetData] arg into its real value.
/// It also is responsible to calculate (or not) variable names that specified
/// [JsonWidgetData] depends on. It produces [ProcessedArg] which contains all
/// that infomations.
///
/// Implementation of that interface is giving the possibility to extend the
/// syntax about custom one.
abstract class ArgProcessor {
  /// Used to give the information if specified [arg]
  /// is supported by [ArgProcessor].
  bool support(dynamic arg);

  /// Process passed [arg] into [ProcessedArg].
  /// The [registry] is giving functions and variables information context for
  /// the processing.
  ///
  /// Passed [listenVariables] is the information about variables that
  /// [JsonWidgetData] depends on. Passing that should be make the
  /// [ArgProcessor] to stop calculating these variable names. It is
  /// treated as a optimization.
  ///
  /// [ProcessedArg] contains info about [arg] real value and variable names
  /// that it depends on.
  ProcessedArg process(
    JsonWidgetRegistry registry,
    dynamic arg,
    Set<String>? listenVariables,
  );
}

/// List of predifinied [ArgProcessor]s.
class ArgProcessors {
  /// Default list of processors used by [JsonWidgetRegistry] to process args.
  static final List<ArgProcessor> defaults = [
    MapArgProcessor(),
    IterableArgProcessor(),
    ExpressionArgProcessor(),
    RawArgProcessor(),
  ];
}

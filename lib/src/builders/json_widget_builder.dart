import 'package:child_builder/child_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:meta/meta.dart';

/// Builder that builds dynamic widgets from JSON or other Map-like structures.
/// Applications can register their own types and builders through the
/// [JsonWidgetRegistry].
@immutable
abstract class JsonWidgetBuilder {
  /// Builds the widget by optionally wrapping it in the [Theme] should one be
  /// set.  Subclasses should not override this and should instead implement the
  /// [buildCustom] function instead.
  @nonVirtual
  Widget build({
    @required ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
  }) {
    var key = data.id?.isNotEmpty == true ? ValueKey(data.id) : null;

    var widget = buildCustom(
      childBuilder: childBuilder,
      context: context,
      data: data,
      key: key,
    );

    if (childBuilder != null) {
      widget = childBuilder(context, widget);
    }

    return widget;
  }

  /// Custom builder that subclasses must override and implement to return the
  /// actual [Widget] to be placed on the tree.
  @visibleForOverriding
  Widget buildCustom({
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  });
}

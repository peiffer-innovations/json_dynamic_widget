import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_material_builder.g.dart';

/// Builder that can build an [Material] widget.
@jsonWidget
abstract class _JsonMaterialBuilder extends JsonWidgetBuilder {
  const _JsonMaterialBuilder({
    required super.args,
  });

  @override
  _Material buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Material extends StatelessWidget {
  const _Material({
    this.animationDuration = kThemeChangeDuration,
    this.borderOnForeground = true,
    this.borderRadius,
    this.child,
    @JsonBuildArg() this.childBuilder,
    this.clipBehavior = Clip.none,
    this.color,
    this.elevation = 0.0,
    this.margin,
    this.materialType = MaterialType.canvas,
    this.padding,
    this.shadowColor,
    this.shape,
    this.surfaceTintColor,
    this.textStyle,
  });

  final Duration animationDuration;
  final bool borderOnForeground;
  final BorderRadius? borderRadius;
  final JsonWidgetData? child;
  final ChildWidgetBuilder? childBuilder;
  final Clip clipBehavior;
  final Color? color;
  final double elevation;
  final EdgeInsetsGeometry? margin;
  final MaterialType materialType;
  final EdgeInsetsGeometry? padding;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? surfaceTintColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final child = (this.child ?? JsonWidgetBuilder.kDefaultChild).build(
      context: context,
      childBuilder: childBuilder,
    );

    Widget result = Material(
      animationDuration: animationDuration,
      borderOnForeground: borderOnForeground,
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
      color: color,
      elevation: elevation,
      key: key,
      shadowColor: shadowColor,
      shape: shape,
      surfaceTintColor: surfaceTintColor,
      textStyle: textStyle,
      type: materialType,
      child: padding == null
          ? child
          : Padding(
              padding: padding!,
              child: child,
            ),
    );

    if (margin != null) {
      result = Padding(
        padding: margin!,
        child: result,
      );
    }

    return result;
  }
}

import 'package:flutter_svg/flutter_svg.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'svg_builder.g.dart';

@jsonWidget
abstract class _SvgBuilder extends JsonWidgetBuilder {
  const _SvgBuilder({
    required super.numSupportedChildren,
  });

  @override
  _Svg buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Svg extends StatelessWidget {
  const _Svg({
    this.asset,
    this.color,
    this.height,
    this.url,
    this.width,
  })  : assert(asset == null || url == null),
        assert(asset != null || url != null);

  final String? asset;
  final Color? color;
  final double? height;
  final String? url;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return asset != null
        ? SvgPicture.asset(
            asset!,
            height: height,
            width: width,
          )
        : SvgPicture.network(
            url!,
            height: height,
            width: width,
          );
  }
}

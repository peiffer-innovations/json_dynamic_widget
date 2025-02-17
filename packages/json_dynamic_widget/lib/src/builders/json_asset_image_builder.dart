import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_asset_image_builder.g.dart';

/// Builder that can build an [Image.asset] widget.
@jsonWidget
abstract class _JsonAssetImageBuilder extends JsonWidgetBuilder {
  const _JsonAssetImageBuilder({required super.args});

  @override
  _AssetImage buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _AssetImage extends StatelessWidget {
  _AssetImage({
    this.alignment = Alignment.center,
    this.cacheHeight,
    this.cacheWidth,
    this.centerSlice,
    this.color,
    this.colorBlendMode,
    this.errorBuilder,
    this.excludeFromSemantics = false,
    this.filterQuality = FilterQuality.low,
    this.fit,
    this.frameBuilder,
    this.gaplessPlayback = false,
    this.height,
    this.isAntiAlias = false,
    this.matchTextDirection = false,
    required this.name,
    this.opacity,
    this.package,
    this.repeat = ImageRepeat.noRepeat,
    this.scale,
    this.semanticLabel,
    this.width,
  }) : assert(name.isNotEmpty == true);

  final Alignment alignment;
  final int? cacheHeight;
  final int? cacheWidth;
  final Rect? centerSlice;
  final Color? color;
  final BlendMode? colorBlendMode;
  final ImageErrorWidgetBuilder? errorBuilder;
  final bool excludeFromSemantics;
  final FilterQuality filterQuality;
  final BoxFit? fit;
  final ImageFrameBuilder? frameBuilder;
  final bool gaplessPlayback;
  final double? height;
  final bool isAntiAlias;
  final bool matchTextDirection;
  final String name;
  final double? opacity;
  final String? package;
  final ImageRepeat repeat;
  final double? scale;
  final String? semanticLabel;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      name,
      alignment: alignment,
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
      centerSlice: centerSlice,
      color: color,
      colorBlendMode: colorBlendMode,
      errorBuilder: errorBuilder,
      excludeFromSemantics: excludeFromSemantics,
      filterQuality: filterQuality,
      fit: fit,
      frameBuilder: frameBuilder,
      gaplessPlayback: gaplessPlayback,
      height: height,
      isAntiAlias: isAntiAlias,
      key: key,
      matchTextDirection: matchTextDirection,
      opacity: opacity == null ? null : AlwaysStoppedAnimation(opacity!),
      package: package,
      repeat: repeat,
      scale: scale,
      semanticLabel: semanticLabel,
      width: width,
    );
  }
}

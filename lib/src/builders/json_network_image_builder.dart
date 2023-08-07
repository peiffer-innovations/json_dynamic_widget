import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_network_image_builder.g.dart';

/// Builder that can build an [Image] widget from a network URL.  See the
/// [fromDynamic] for the format.
@jsonWidget
abstract class _JsonNetworkImageBuilder extends JsonWidgetBuilder {
  const _JsonNetworkImageBuilder({
    required super.numSupportedChildren,
  });

  @override
  _NetworkImage buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _NetworkImage extends StatelessWidget {
  _NetworkImage({
    required this.alignment,
    this.cacheHeight,
    this.cacheWidth,
    this.centerSlice,
    this.color,
    this.colorBlendMode,
    this.errorBuilder,
    required this.excludeFromSemantics,
    required this.filterQuality,
    this.fit,
    this.frameBuilder,
    required this.gaplessPlayback,
    this.height,
    this.headers,
    required this.isAntiAlias,
    this.loadingBuilder,
    required this.matchTextDirection,
    this.opacity,
    required this.repeat,
    required this.scale,
    this.semanticLabel,
    required this.src,
    this.width,
  });

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
  final Map<String, String>? headers;
  final double? height;
  final bool isAntiAlias;
  final ImageLoadingBuilder? loadingBuilder;
  final bool matchTextDirection;
  final double? opacity;
  final ImageRepeat repeat;
  final double scale;
  final String? semanticLabel;
  final String src;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
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
      headers: headers,
      height: height,
      isAntiAlias: isAntiAlias,
      key: key,
      loadingBuilder: loadingBuilder,
      matchTextDirection: matchTextDirection,
      opacity: opacity == null ? null : AlwaysStoppedAnimation(opacity!),
      repeat: repeat,
      scale: scale,
      semanticLabel: semanticLabel,
      width: width,
    );
  }
}

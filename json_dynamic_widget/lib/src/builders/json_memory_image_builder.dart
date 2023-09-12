import 'dart:convert';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_memory_image_builder.g.dart';

/// Builder that can build an [Image] widget from memory.
@jsonWidget
abstract class _JsonMemoryImageBuilder extends JsonWidgetBuilder {
  const _JsonMemoryImageBuilder({
    required super.args,
  });

  @JsonArgDecoder('image')
  Uint8List _decodeImage({required dynamic value}) => base64.decode(value);

  @override
  _MemoryImage buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _MemoryImage extends StatelessWidget {
  const _MemoryImage({
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
    required this.image,
    this.isAntiAlias = false,
    this.matchTextDirection = false,
    this.opacity,
    this.repeat = ImageRepeat.noRepeat,
    this.scale = 1.0,
    this.semanticLabel,
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
  final double? height;
  final bool isAntiAlias;
  final Uint8List image;
  final bool matchTextDirection;
  final double? opacity;
  final ImageRepeat repeat;
  final double scale;
  final String? semanticLabel;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      image,
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
      repeat: repeat,
      scale: scale,
      semanticLabel: semanticLabel,
      width: width,
    );
  }
}

import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Image] widget using bundled assets.  See the
/// [fromDynamic] for the format.
class JsonAssetImageBuilder extends JsonWidgetBuilder {
  JsonAssetImageBuilder({
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
    required this.isAntiAlias,
    required this.matchTextDirection,
    required this.name,
    this.opacity,
    this.package,
    required this.repeat,
    this.scale,
    this.semanticLabel,
    this.width,
  })  : assert(name.isNotEmpty == true),
        super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;

  static const type = 'asset_image';

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

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": <Alignment>,
  ///   "cacheHeight": <int>,
  ///   "cacheWidth": <int>,
  ///   "centerSlice": <Rect>,
  ///   "color": <Color>,
  ///   "colorBlendMode": <BlendMode>,
  ///   "errorBuilder": <WidgetBuilder>,
  ///   "excludeFromSemantics": <bool>,
  ///   "filterQuality": <FilterQuality>,
  ///   "fit": <BoxFit>,
  ///   "frameBuilder": <ImageFrameBuilder>,
  ///   "gaplessPlayback": <bool>,
  ///   "height": <double>,
  ///   "isAntiAlias": <bool>,
  ///   "matchTextDirection": <bool>,
  ///   "name": <String>,
  ///   "opacity": <double>,
  ///   "package": <String>,
  ///   "repeat": <ImageRepeat>,
  ///   "scale": <double>,
  ///   "semanticLabel": <String>,
  ///   "width": <double>
  /// }
  /// ```
  ///
  /// As a note, the [ImageErrorWidgetBuilder] and [ImageFrameBuilder] cannot be
  /// decoded via JSON.  Instead, the only way to bind those values to the
  /// builder is to use a function or a variable reference via the
  /// [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeAlignment]
  ///  * [ThemeDecoder.decodeBlendMode]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeImageRepeat]
  static JsonAssetImageBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonAssetImageBuilder? result;

    if (map != null) {
      result = JsonAssetImageBuilder(
        alignment: ThemeDecoder.decodeAlignment(
              map['alignment'],
              validate: false,
            ) ??
            Alignment.center,
        cacheHeight: JsonClass.parseInt(map['cacheHeight']),
        cacheWidth: JsonClass.parseInt(map['cacheWidth']),
        centerSlice: ThemeDecoder.decodeRect(
          map['centerSlice'],
          validate: false,
        ),
        color: ThemeDecoder.decodeColor(
          map['color'],
          validate: false,
        ),
        colorBlendMode: ThemeDecoder.decodeBlendMode(
          map['colorBlendMode'],
          validate: false,
        ),
        errorBuilder: map['errorBuilder'],
        excludeFromSemantics: JsonClass.parseBool(map['excludeFromSemantics']),
        filterQuality: ThemeDecoder.decodeFilterQuality(
              map['filterQuality'],
              validate: false,
            ) ??
            FilterQuality.low,
        fit: ThemeDecoder.decodeBoxFit(
          map['fit'],
          validate: false,
        ),
        frameBuilder: map['frameBuilder'],
        gaplessPlayback: JsonClass.parseBool(map['gaplessPlayback']),
        height: JsonClass.parseDouble(map['height']),
        isAntiAlias: JsonClass.parseBool(map['isAntiAlias']),
        matchTextDirection: JsonClass.parseBool(map['matchTextDirection']),
        name: map['name'],
        package: map['package'],
        repeat: ThemeDecoder.decodeImageRepeat(
              map['imageRepeat'],
              validate: false,
            ) ??
            ImageRepeat.noRepeat,
        scale: JsonClass.parseDouble(map['scale']),
        semanticLabel: map['semanticLabel'],
        width: JsonClass.parseDouble(map['width']),
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
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

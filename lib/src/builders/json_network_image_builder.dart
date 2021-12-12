import 'dart:typed_data';

import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Image] widget from a network URL.  See the
/// [fromDynamic] for the format.
class JsonNetworkImageBuilder extends JsonWidgetBuilder {
  JsonNetworkImageBuilder({
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
  })  : assert(src.isNotEmpty == true),
        super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'network_image';

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
  ///   "headers": <<Map<String, String>>
  ///   "isAntiAlias": <bool>,
  ///   "loadingBuilder": <ImageLoadingBuilder>,
  ///   "matchTextDirection": <bool>,
  ///   "opacity": <double>,
  ///   "repeat": <ImageRepeat>,
  ///   "scale": <double>,
  ///   "semanticLabel": <String>,
  ///   "src": <String>,
  ///   "width": <double>
  /// }
  /// ```
  ///
  /// The "image" attribute can be either a base64 encoded String, or a
  /// [Uint8List] returned via a function or variable reference using the
  /// [JsonWidgetRegistry].
  ///
  /// As a note, the [ImageErrorWidgetBuilder], [ImageFrameBuilder], and
  /// [ImageLoadingBuilder] cannot be decoded via JSON.  Instead, the only way
  /// to bind those values to the builder is to use a function or a variable
  /// reference via the [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeAlignment]
  ///  * [ThemeDecoder.decodeBlendMode]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeImageRepeat]
  static JsonNetworkImageBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonNetworkImageBuilder? result;

    if (map != null) {
      result = JsonNetworkImageBuilder(
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
        headers: map['headers'] == null
            ? null
            : Map<String, String>.from(map['headers']),
        isAntiAlias: JsonClass.parseBool(map['isAntiAlias']),
        loadingBuilder: map['loadingBuilder'],
        matchTextDirection: JsonClass.parseBool(map['matchTextDirection']),
        opacity: JsonClass.parseDouble(map['opacity']),
        repeat: ThemeDecoder.decodeImageRepeat(
              map['imageRepeat'],
              validate: false,
            ) ??
            ImageRepeat.noRepeat,
        scale: JsonClass.parseDouble(map['scale'], 1.0)!,
        semanticLabel: map['semanticLabel'],
        src: map['src'],
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

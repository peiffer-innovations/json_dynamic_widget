import 'dart:convert';
import 'dart:typed_data';

import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Image] widget from memory.  See the [fromDynamic]
/// for the format.
class JsonMemoryImageBuilder extends JsonWidgetBuilder {
  JsonMemoryImageBuilder({
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
    required this.image,
    required this.isAntiAlias,
    required this.matchTextDirection,
    this.opacity,
    required this.repeat,
    required this.scale,
    this.semanticLabel,
    this.width,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'memory_image';

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
  ///   "image": <String | Uint8List>,
  ///   "isAntiAlias": <bool>,
  ///   "matchTextDirection": <bool>,
  ///   "opacity": <double>,
  ///   "repeat": <ImageRepeat>,
  ///   "scale": <double>,
  ///   "semanticLabel": <String>,
  ///   "width": <double>
  /// }
  /// ```
  /// The "image" attribute can be either a base64 encoded String, or a
  /// [Uint8List] returned via a function or variable reference using the
  /// [JsonWidgetRegistry].
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
  static JsonMemoryImageBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonMemoryImageBuilder? result;

    if (map != null) {
      dynamic image = map['image'];
      if (image is String) {
        image = base64.decode(image);
      }

      result = JsonMemoryImageBuilder(
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
        image: image,
        matchTextDirection: JsonClass.parseBool(map['matchTextDirection']),
        repeat: ThemeDecoder.decodeImageRepeat(
              map['imageRepeat'],
              validate: false,
            ) ??
            ImageRepeat.noRepeat,
        opacity: JsonClass.parseDouble(map['opacity']),
        scale: JsonClass.parseDouble(map['scale'], 1.0)!,
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

import 'dart:convert';
import 'dart:typed_data';

import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Image] widget using bundled assets.  See the
/// [fromDynamic] for the format.
class JsonAssetImageBuilder extends JsonWidgetBuilder {
  JsonAssetImageBuilder({
    this.alignment,
    this.cacheHeight,
    this.cacheWidth,
    this.centerSlice,
    this.color,
    this.colorBlendMode,
    this.errorBuilder,
    this.excludeFromSemantics,
    this.filterQuality,
    this.fit,
    this.frameBuilder,
    this.gaplessPlayback,
    this.height,
    this.matchTextDirection,
    @required this.name,
    this.package,
    this.repeat,
    this.scale,
    this.semanticLabel,
    this.width,
  }) : assert(name?.isNotEmpty == true);

  static const type = 'asset_image';

  final Alignment alignment;
  final int cacheHeight;
  final int cacheWidth;
  final Rect centerSlice;
  final Color color;
  final BlendMode colorBlendMode;
  final ImageErrorWidgetBuilder errorBuilder;
  final bool excludeFromSemantics;
  final FilterQuality filterQuality;
  final BoxFit fit;
  final ImageFrameBuilder frameBuilder;
  final bool gaplessPlayback;
  final double height;
  final bool matchTextDirection;
  final String name;
  final String package;
  final ImageRepeat repeat;
  final double scale;
  final String semanticLabel;
  final double width;

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
  ///   "matchTextDirection": <bool>,
  ///   "name": <String>,
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
  static JsonAssetImageBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonAssetImageBuilder result;

    if (map != null) {
      result = JsonAssetImageBuilder(
        alignment:
            ThemeDecoder.decodeAlignment(map['alignment']) ?? Alignment.center,
        cacheHeight: JsonClass.parseInt(map['cacheHeight']),
        cacheWidth: JsonClass.parseInt(map['cacheWidth']),
        centerSlice: ThemeDecoder.decodeRect(map['centerSlice']),
        color: ThemeDecoder.decodeColor(map['color']),
        colorBlendMode: ThemeDecoder.decodeBlendMode(map['colorBlendMode']),
        errorBuilder: map['errorBuilder'],
        excludeFromSemantics: JsonClass.parseBool(map['excludeFromSemantics']),
        filterQuality: ThemeDecoder.decodeFilterQuality(map['filterQuality']) ??
            FilterQuality.low,
        fit: ThemeDecoder.decodeBoxFit(map['fit']),
        frameBuilder: map['frameBuilder'],
        gaplessPlayback: JsonClass.parseBool(map['gaplessPlayback']),
        height: JsonClass.parseDouble(map['height']),
        matchTextDirection: JsonClass.parseBool(map['matchTextDirection']),
        name: map['name'],
        package: map['package'],
        repeat: ThemeDecoder.decodeImageRepeat(map['imageRepeat']) ??
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
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.isNotEmpty != true,
      '[JsonAssetImageBuilder] does not support children.',
    );

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
      matchTextDirection: matchTextDirection,
      package: package,
      repeat: repeat,
      scale: scale,
      semanticLabel: semanticLabel,
      width: width,
    );
  }
}

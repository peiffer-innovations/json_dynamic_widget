import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

class SvgBuilder extends JsonWidgetBuilder {
  SvgBuilder({
    this.asset,
    this.color,
    this.height,
    this.url,
    this.width,
  })  : assert(asset == null || url == null),
        assert(asset != null || url != null),
        super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'svg';

  final String? asset;
  final Color? color;
  final double? height;
  final String? url;
  final double? width;

  static SvgBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    if (map == null) {
      throw Exception('[SvgBuilder]: map is null');
    }

    return SvgBuilder(
      asset: map['asset'],
      color: ThemeDecoder.decodeColor(
        map['color'],
        validate: false,
      ),
      height: JsonClass.parseDouble(map['height']),
      url: map['url'],
      width: JsonClass.parseDouble(map['width']),
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    assert(
      data.children?.isNotEmpty != true,
      '[SvgBuilder] does not support children.',
    );

    return asset != null
        ? SvgPicture.asset(
            asset!,
            color: color,
            height: height,
            width: width,
          )
        : SvgPicture.network(
            url!,
            color: color,
            height: height,
            width: width,
          );
  }
}

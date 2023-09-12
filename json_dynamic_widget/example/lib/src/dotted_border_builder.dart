import 'package:dotted_border/dotted_border.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'dotted_border_builder.g.dart';

@jsonWidget
abstract class _DottedBorderBuilder extends JsonWidgetBuilder {
  const _DottedBorderBuilder({
    required super.args,
  });

  @JsonArgEncoder('borderType')
  static String _encodeBorderType(BorderType value) {
    var result = 'circle';

    switch (value) {
      case BorderType.Circle:
        result = 'circle';
        break;
      case BorderType.Oval:
        result = 'oval';
        break;
      case BorderType.Rect:
        result = 'rect';
        break;
      case BorderType.RRect:
        result = 'rrect';
        break;
    }

    return result;
  }

  @JsonArgEncoder('strokeCap')
  static String _encodeStrokeCap(StrokeCap value) {
    var result = 'butt';

    switch (value) {
      case StrokeCap.butt:
        result = 'butt';
        break;

      case StrokeCap.round:
        result = 'round';
        break;

      case StrokeCap.square:
        result = 'square';
        break;
    }

    return result;
  }

  @JsonArgDecoder('borderType')
  BorderType _decodeBorderType({
    required value,
  }) {
    var result = BorderType.Circle;

    if (value is String) {
      switch (value) {
        case 'circle':
          result = BorderType.Circle;
          break;

        case 'oval':
          result = BorderType.Oval;
          break;

        case 'rect':
          result = BorderType.Rect;
          break;

        case 'rrect':
          result = BorderType.RRect;
          break;
      }
    }

    return result;
  }

  @JsonArgDecoder('strokeCap')
  StrokeCap _decodeStrokeCap({
    required value,
  }) {
    var result = StrokeCap.butt;

    if (value is String) {
      switch (value) {
        case 'butt':
          result = StrokeCap.butt;
          break;

        case 'round':
          result = StrokeCap.round;
          break;

        case 'square':
          result = StrokeCap.square;
          break;
      }
    }

    return result;
  }

  @override
  DottedBorder buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

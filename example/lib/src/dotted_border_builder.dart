import 'package:dotted_border/dotted_border.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'dotted_border_builder.g.dart';

@jsonWidget
abstract class _DottedBorderBuilder extends JsonWidgetBuilder {
  const _DottedBorderBuilder();

  @JsonArgDecoder('borderType')
  BorderType _decodeBorderType({
    required value,
  }) {
    var result = BorderType.Rect;

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

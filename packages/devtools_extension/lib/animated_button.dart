import 'package:devtools_app_shared/ui.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class AnimatedButton extends StatefulWidget {
  final Function onPressed;
  final String text;
  final IconData icon;
  final String successsText;
  final String tooltip;
  final Color textColor;
  const AnimatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.successsText,
    required this.icon,
    required this.tooltip,
    required this.textColor,
  });

  @override
  AnimatedButtonState createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late ColorTween _colorTween;
  late Animation<Color?> _colorTweenAnimation;
  late String _normalText;
  late String _successText;
  late String _currentText;
  late IconData _currentIcon;

  @override
  void initState() {
    super.initState();
    _normalText = widget.text;
    _currentText = _normalText;
    _successText = widget.successsText;
    _currentIcon = widget.icon;
    _colorTween = ColorTween(begin: widget.textColor, end: Colors.green);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _colorTweenAnimation = _colorTween.animate(_animationController);
    _colorTweenAnimation.addListener(() {
      setState(() {});
    });
  }

  Future<void> changeColors() async {
    _animationController.forward();
    _currentText = _successText;
    await Future<void>.delayed(const Duration(milliseconds: 700), () {
      _animationController.reverse();
      _currentText = _normalText;
    });
  }

  void setButtonTexts(String normalText, String successText) {
    if (normalText != _normalText || successText != _successText) {
      setState(() {
        if (_currentText == _normalText) {
          _currentText = normalText;
        } else {
          _currentText = successText;
        }
        _normalText = normalText;
        _successText = successText;
      });
    }
  }

  void setIcon(IconData icon) {
    if (widget.icon != icon) {
      setState(() {
        _currentIcon = icon;
      });
    }
  }

  void _onPressed() {
    widget.onPressed();
    changeColors();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DevToolsButton(
        onPressed: _onPressed,
        color: _colorTweenAnimation.value,
        icon: _currentIcon,
        label: _currentText,
        tooltip: widget.tooltip,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InputError extends StatefulWidget {
  InputError({
    this.error,
    Key? key,
  }) : super(key: key);

  final String? error;

  @override
  _InputErrorState createState() => _InputErrorState();
}

class _InputErrorState extends State<InputError> {
  String? _error;

  @override
  void initState() {
    super.initState();

    _error = widget.error;
  }

  @override
  void didUpdateWidget(InputError oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.error != widget.error && mounted == true) {
      if (widget.error?.isNotEmpty == true) {
        _error = widget.error;
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    const standardDuration = Duration(milliseconds: 200);
    var theme = Theme.of(context);

    return ClipRect(
      child: AnimatedOpacity(
        duration: standardDuration,
        opacity: widget.error?.isNotEmpty == true ? 1.0 : 0.0,
        child: AnimatedContainer(
          alignment: Alignment.center,
          curve: Curves.ease,
          duration: standardDuration,
          height: widget.error?.isNotEmpty == true ? 24.0 : 0.0,
          child: Text(
            _error ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.caption!.copyWith(color: theme.errorColor),
          ),
        ),
      ),
    );
  }
}

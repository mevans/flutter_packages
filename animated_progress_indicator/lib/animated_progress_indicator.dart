library animated_progress_indicator;

import 'package:flutter/material.dart';

class AnimatedProgressIndicator extends ImplicitlyAnimatedWidget {
  final double value;
  final Color backgroundColor;
  final Animation<Color> valueColor;
  final Key key;

  AnimatedProgressIndicator({
    this.key,
    this.value,
    this.backgroundColor,
    this.valueColor,
    Curve curve = Curves.linear,
    @required Duration duration,
  }) : super(key: key, curve: curve, duration: duration);

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _AnimatedProgressIndicatorState();
  }
}

class _AnimatedProgressIndicatorState
    extends AnimatedWidgetBaseState<AnimatedProgressIndicator> {
  Tween<double> _value;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: _value.evaluate(animation),
      backgroundColor: widget.backgroundColor,
      valueColor: widget.valueColor,
    );
  }

  @override
  void forEachTween(visitor) {
    _value = visitor(
        _value, widget.value, (dynamic value) => Tween<double>(begin: value));
  }
}

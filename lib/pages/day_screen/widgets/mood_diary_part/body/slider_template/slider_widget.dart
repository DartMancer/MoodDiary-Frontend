import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

import 'slider_template.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required double currentValue,
    required this.widget,
    required this.onChanged,
  }) : _currentValue = currentValue;

  final double _currentValue;
  final SliderTemplate widget;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentValue,
      min: 1,
      max: 5,
      divisions: 4,
      onChanged: (value) => onChanged(value: value),
      onChangeEnd: (value) => widget.saveSliderValue(value: value),
      activeColor: mainClr,
      inactiveColor: greyClr5,
    );
  }
}

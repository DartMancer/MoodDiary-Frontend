import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

import 'border_titles.dart';
import 'slider_widget.dart';

class SliderTemplate extends StatefulWidget {
  const SliderTemplate({
    super.key,
    required this.leftTitle,
    required this.rightTitle,
    required this.saveSliderValue,
  });

  final String leftTitle, rightTitle;
  final Function saveSliderValue;

  @override
  State<SliderTemplate> createState() => _SliderTemplateState();
}

class _SliderTemplateState extends State<SliderTemplate> {
  double _currentValue = 3;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.096),
      child: Stack(
        children: [
          Container(
            height: width * 0.20533,
            decoration: BoxDecoration(
              color: whiteClr,
              borderRadius: BorderRadius.circular(width * 0.034667),
              boxShadow: StyleComponents().boxShadow(context: context),
            ),
          ),
          Column(
            children: [
              SliderWidget(
                currentValue: _currentValue,
                widget: widget,
                onChanged: _onChanged,
              ),
              BorderTitles(widget: widget),
            ],
          ),
        ],
      ),
    );
  }

  void _onChanged({required double value}) {
    setState(() => _currentValue = value);
  }
}

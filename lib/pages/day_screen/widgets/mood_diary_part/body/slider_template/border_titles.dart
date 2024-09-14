import 'package:flutter/material.dart';

import 'border_title.dart';
import 'slider_template.dart';

class BorderTitles extends StatelessWidget {
  const BorderTitles({
    super.key,
    required this.widget,
  });

  final SliderTemplate widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BorderTitle(title: widget.leftTitle),
        BorderTitle(title: widget.rightTitle, isRigth: true),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class StyleComponents {
  List<BoxShadow> boxShadow({required BuildContext context}) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return [
      BoxShadow(
        color: blackClr.withOpacity(0.1),
        offset: Offset(width * 0.00533, width * 0.01067),
        blurRadius: width * 0.02933,
      ),
      BoxShadow(
        color: backgroundLightClr,
        offset: Offset(width * 0.00533, -width * 0.01067),
        blurRadius: width * 0.02933,
      ),
    ];
  }
}

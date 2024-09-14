import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.1),
      child: Container(
        width: width * 0.9,
        height: width * 0.01,
        decoration: BoxDecoration(
          color: greyClr4,
          borderRadius: BorderRadius.circular(width),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class BorderTitle extends StatelessWidget {
  const BorderTitle({
    super.key,
    required this.title,
    this.isRigth = false,
  });

  final String title;
  final bool isRigth;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Padding(
      padding: isRigth
          ? EdgeInsets.only(right: width * 0.05667)
          : EdgeInsets.only(left: width * 0.05667),
      child: SizedBox(
        height: width * 0.05,
        child: ASText(
          text: title,
          color: greyClr2,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

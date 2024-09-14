import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class EmotiomsDetailCard extends StatelessWidget {
  const EmotiomsDetailCard({
    super.key,
    required this.index,
    required this.emotionsValues,
  });

  final int index;
  final List emotionsValues;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Container(
      margin: EdgeInsets.all(width * 0.01282),
      height: width * 0.074667,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(width * 0.008),
        ),
        color: whiteClr,
        boxShadow: StyleComponents().boxShadow(context: context),
      ),
      child: SizedBox(
        height: width * 0.0448,
        child: ASText(
          text: emotionsValues[index],
          color: blackClr,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

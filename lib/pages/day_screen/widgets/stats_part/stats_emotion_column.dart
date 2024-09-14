import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class StatsEmotionColumn extends StatelessWidget {
  const StatsEmotionColumn({
    super.key,
    required this.cardImage,
    required this.cardTitle,
  });

  final String cardImage, cardTitle;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Column(
      children: [
        Image.asset(cardImage, width: width * 0.15),
        SizedBox(
          height: width * 0.05,
          child: ASText(
            text: cardTitle,
            color: blackClr,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

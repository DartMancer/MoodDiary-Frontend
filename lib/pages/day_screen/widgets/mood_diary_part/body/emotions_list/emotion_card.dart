import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class EmotionCard extends StatelessWidget {
  const EmotionCard({
    super.key,
    required this.index,
    required this.emotionsKeys,
    required this.emotionsValues,
    required this.selectedEmotion,
  });

  final int index;
  final List<String> emotionsKeys;
  final List<List<dynamic>> emotionsValues;
  final int selectedEmotion;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;

    return Container(
      width: width * 0.22133,
      height: width * 0.31467,
      decoration: BoxDecoration(
        color: whiteClr,
        border: Border.all(
          color: index == selectedEmotion ? mainClr : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(
          width * 0.202667,
        ),
        boxShadow: StyleComponents().boxShadow(context: context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width * 0.16133,
            child: Image.asset(emotionsValues[index].first),
          ),
          SizedBox(
            height: width * 0.04,
            child: ASText(
              text: emotionsKeys[index],
              color: blackClr,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

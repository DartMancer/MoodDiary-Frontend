import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class EmotiomsDetailCard extends StatelessWidget {
  const EmotiomsDetailCard({
    super.key,
    required this.index,
    required this.emotionsValues,
    required this.selectedEmotion,
    required this.emotionDetailSelected,
    required this.emotionDetailSelect,
  });

  final int index;
  final List emotionsValues;
  final int selectedEmotion;
  final List<int> emotionDetailSelected;
  final Function emotionDetailSelect;

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
        color: emotionDetailSelected.contains(index) ? mainClr : whiteClr,
        boxShadow: StyleComponents().boxShadow(context: context),
      ),
      child: MaterialButton(
        onPressed: () {
          emotionDetailSelect(emotionDetailIndex: index);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(width * 0.008),
          ),
        ),
        child: SizedBox(
          height: width * 0.0448,
          child: ASText(
            text: emotionsValues[selectedEmotion][1][index],
            color: emotionDetailSelected.contains(index) ? whiteClr : blackClr,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

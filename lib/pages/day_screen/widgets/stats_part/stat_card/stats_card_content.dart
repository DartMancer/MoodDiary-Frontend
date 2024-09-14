import 'package:flutter/material.dart';
import 'package:mood_diary/data/model/model.dart';
import 'package:mood_diary/pages/day_screen/day_screen.dart';

class StatsCardContent extends StatelessWidget {
  const StatsCardContent({
    super.key,
    required this.moodContent,
  });

  final MoodNoteContent moodContent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StatsEmotionColumn(
          cardImage: moodContent.mainEmotionImage,
          cardTitle: moodContent.mainEmotion,
        ),
        StatsColumn(
          title: 'Сресс',
          content: moodContent.stressLevel.toInt().toString(),
        ),
        StatsColumn(
          title: 'Самооценка',
          content: moodContent.selfAssessment.toInt().toString(),
        ),
      ],
    );
  }
}

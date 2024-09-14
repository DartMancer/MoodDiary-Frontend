import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mood_diary/data/model/model.dart';
import 'package:mood_diary/pages/day_screen/view/view.dart';

class StatsMainCardContent extends StatelessWidget {
  const StatsMainCardContent({
    super.key,
    required this.box,
    required this.emotionsList,
  });

  final Box<MoodNote> box;
  final Map<String, List<dynamic>> emotionsList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StatsEmotionColumn(
          cardImage: DayScreenFunctions().topEmotion(
            box: box,
            emotionsList: emotionsList,
          )[1],
          cardTitle:
              ' Топ: ${DayScreenFunctions().topEmotion(box: box, emotionsList: emotionsList)[0]}',
        ),
        StatsColumn(
          title: 'Стресс',
          content: DayScreenFunctions().averageStats(
            box: box,
            isStress: true,
          ),
        ),
        StatsColumn(
          title: 'Самооценка',
          content: DayScreenFunctions().averageStats(
            box: box,
            isStress: false,
          ),
        ),
      ],
    );
  }
}

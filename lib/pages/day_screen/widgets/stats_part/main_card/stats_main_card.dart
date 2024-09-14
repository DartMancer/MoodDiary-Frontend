import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mood_diary/core/core.dart';
import 'package:mood_diary/data/model/model.dart';

import 'stats_main_card_content.dart';
import 'stats_main_card_title.dart';

class StatsMainCard extends StatelessWidget {
  const StatsMainCard({
    super.key,
    required this.box,
    required this.emotionsList,
  });

  final Box<MoodNote> box;
  final Map<String, List<dynamic>> emotionsList;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        height: width * 0.30533,
        decoration: BoxDecoration(
          color: whiteClr,
          borderRadius: BorderRadius.circular(width * 0.034667),
          boxShadow: StyleComponents().boxShadow(context: context),
        ),
        child: Column(
          children: [
            const StatsMainCardTitle(),
            StatsMainCardContent(
              box: box,
              emotionsList: emotionsList,
            ),
          ],
        ),
      ),
    );
  }
}

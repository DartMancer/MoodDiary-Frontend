import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';
import 'package:mood_diary/data/model/model.dart';

class StatsCardTimeReg extends StatelessWidget {
  const StatsCardTimeReg({
    super.key,
    required this.moodContent,
  });

  final MoodNoteContent moodContent;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: width * 0.05,
          child: ASText(
            text: moodContent.currentDate,
            color: greyClr2,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

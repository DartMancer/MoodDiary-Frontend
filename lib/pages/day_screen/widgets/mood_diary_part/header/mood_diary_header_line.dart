import 'package:flutter/material.dart';

import 'actual_time.dart';
import 'calendar_button.dart';

class MoodDiaryHeader extends StatelessWidget {
  const MoodDiaryHeader({
    super.key,
    required this.dateTime,
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Padding(
      padding: EdgeInsets.only(
        top: width * 0.17067,
        bottom: width * 0.06667,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: width * 0.084),
          ActualTime(dateTime: dateTime),
          const CalendarButton()
        ],
      ),
    );
  }
}

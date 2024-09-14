import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class CalendarToggleButton extends StatelessWidget {
  const CalendarToggleButton({
    super.key,
    required this.isMonth,
    required this.calendarToggle,
  });

  final bool isMonth;
  final Function calendarToggle;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return IconButton(
      onPressed: () => calendarToggle(),
      icon: Icon(
        isMonth ? MoodDiaryIcons.yearcalendar : MoodDiaryIcons.monthcalendar,
        size: width * 0.08,
        color: greyClr1,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

class TodayButton extends StatelessWidget {
  const TodayButton({
    super.key,
    required this.calendarController,
    required this.todayButton,
  });

  final CleanCalendarController calendarController;
  final Function todayButton;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Padding(
      padding: EdgeInsets.only(right: width * 0.042667),
      child: TextButton(
        onPressed: () => todayButton(calendarController),
        child: Text(
          'Сегодня',
          style: TextStyle(
            fontSize: 18,
            fontFamily: fontApp,
            color: greyClr1,
          ),
        ),
      ),
    );
  }
}

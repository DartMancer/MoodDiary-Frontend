import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_diary/config/config.dart';
import 'package:mood_diary/core/core.dart';

class CalendarButton extends StatelessWidget {
  const CalendarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return IconButton(
      onPressed: () {
        GetIt.I<AppRouter>().push(const CalendarRoute());
      },
      icon: Icon(
        MoodDiaryIcons.calendarIcon,
        color: greyClr2,
        size: width * 0.064,
      ),
    );
  }
}

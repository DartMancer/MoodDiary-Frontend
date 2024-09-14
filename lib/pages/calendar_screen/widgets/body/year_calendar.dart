import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class YearCalendar extends StatelessWidget {
  const YearCalendar({
    super.key,
    required this.calendarController,
    required this.setDaysOfWeekWidgets,
  });

  final CleanCalendarController calendarController;
  final Function setDaysOfWeekWidgets;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: Padding(
              padding: EdgeInsets.only(top: width * 0.042667),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: setDaysOfWeekWidgets(),
              ),
            ),
          ),
          SizedBox(
            height: height,
            child: ScrollableCleanCalendar(
              locale: 'ru',
              calendarController: calendarController,
              monthTextAlign: TextAlign.start,
              dayRadius: 30,
              layout: Layout.DEFAULT,
              calendarCrossAxisSpacing: 0,
              dayBackgroundColor: whiteClr,
              daySelectedBackgroundColor: mainClr,
              showWeekdays: false,
            ),
          ),
        ],
      ),
    );
  }
}

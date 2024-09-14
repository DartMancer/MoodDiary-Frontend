import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';
import 'package:scrolling_years_calendar/scrolling_years_calendar.dart';

class MonthCalendar extends StatelessWidget {
  const MonthCalendar({
    super.key,
    required List<String> months,
  }) : _months = months;

  final List<String> _months;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScrollingYearsCalendar(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 1)),
        lastDate: DateTime.now().add(const Duration(days: 365)),
        currentDateColor: mainClr,
        monthNames: _months,
        monthTitleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: blackClr,
        ),
        daysColor: blackClr,
        onMonthTap: () {},
      ),
    );
  }
}

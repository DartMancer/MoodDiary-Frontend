import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

import 'view.dart';

@RoutePage()
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final List<String> _daysOfWeek = ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'];
  final List<String> _months = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь',
  ];

  bool isMonth = true;

  @override
  Widget build(BuildContext context) {
    final calendarController = CleanCalendarController(
      minDate: DateTime.now(),
      maxDate: DateTime.now().add(const Duration(days: 365)),
      rangeMode: false,
      weekdayStart: DateTime.monday,
      initialDateSelected: DateTime.now(),
    );

    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundLightClr,
        leading: const CloseButtonWidget(),
        actions: [
          CalendarToggleButton(
            isMonth: isMonth,
            calendarToggle: _calendarToggle,
          ),
          AnimatedCrossFade(
            firstChild: TodayButton(
              calendarController: calendarController,
              todayButton: _todayButton,
            ),
            secondChild: SizedBox(width: width * 0.05333),
            crossFadeState:
                isMonth ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
            sizeCurve: Curves.easeInOutCubic,
          ),
        ],
      ),
      body: isMonth
          ? YearCalendar(
              calendarController: calendarController,
              setDaysOfWeekWidgets: _setDaysOfWeekWidgets,
            )
          : MonthCalendar(months: _months),
    );
  }

  void _calendarToggle() {
    return setState(() {
      isMonth = !isMonth;
    });
  }

  void _todayButton(CleanCalendarController calendarController) {
    setState(() {
      calendarController.scrollToMonth(
        date: DateTime.now(),
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  List<Widget> _setDaysOfWeekWidgets() {
    List<Widget> daysList = [];
    for (var i = 0; i < _daysOfWeek.length; i++) {
      daysList.add(
        Text(
          _daysOfWeek[i],
          style: TextStyle(
            color: greyClr1,
            fontFamily: fontApp,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
    return daysList;
  }
}

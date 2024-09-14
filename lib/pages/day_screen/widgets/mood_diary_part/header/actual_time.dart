import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';
import 'package:mood_diary/pages/day_screen/day_screen.dart';

class ActualTime extends StatelessWidget {
  const ActualTime({
    super.key,
    required this.dateTime,
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DayScreenFunctions().formatDate(dateTime: dateTime);
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return SizedBox(
      height: width * 0.074667,
      child: ASText(
        text: formattedDate,
        color: greyClr2,
        textAlign: TextAlign.center,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class StatsMainCardTitle extends StatelessWidget {
  const StatsMainCardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: width * 0.08,
          child: ASText(
            text: 'Общая статистика',
            color: blackClr,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

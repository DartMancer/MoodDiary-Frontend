import 'package:flutter/material.dart';

import 'mood_diary_header_line.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.isDiary,
    required this.dateTime,
  });

  final bool isDiary;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return AnimatedCrossFade(
      // Header: Actual time stroke and Calendar button
      firstChild: MoodDiaryHeader(dateTime: dateTime),
      secondChild: SizedBox(height: width * 0.18734),
      crossFadeState:
          isDiary ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 300),
      sizeCurve: Curves.easeInCubic,
    );
  }
}

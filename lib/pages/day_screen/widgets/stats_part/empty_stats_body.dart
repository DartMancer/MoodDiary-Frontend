import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class EmptyStatsBody extends StatelessWidget {
  const EmptyStatsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Center(
      child: SizedBox(
        height: width * 0.05,
        child: ASText(
          text: 'У Вас еще нет ни одной заметки',
          color: greyClr1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

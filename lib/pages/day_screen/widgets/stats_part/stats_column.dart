import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class StatsColumn extends StatelessWidget {
  const StatsColumn({
    super.key,
    required this.title,
    required this.content,
  });

  final String title, content;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: width * 0.06,
          child: ASText(
            text: title,
            color: blackClr,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: width * 0.09,
          child: ASText(
            text: content,
            color: blackClr,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mood_diary/pages/note_screen/view/view.dart';

class NumbersIndicators extends StatelessWidget {
  const NumbersIndicators({
    super.key,
    required this.widget,
  });

  final NoteScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StatsColumn(
          title: 'Стресс',
          content: widget.noteContent.stressLevel.toInt().toString(),
        ),
        StatsColumn(
          title: 'Самооценка',
          content: widget.noteContent.selfAssessment.toInt().toString(),
        ),
      ],
    );
  }
}
